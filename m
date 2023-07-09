Received: from box.fidei.email (box.fidei.email [71.19.144.250])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7382FBF6
	for <fsverity@lists.linux.dev>; Sun,  9 Jul 2023 19:19:09 +0000 (UTC)
Received: from authenticated-user (box.fidei.email [71.19.144.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by box.fidei.email (Postfix) with ESMTPSA id 39D7B8047C;
	Sun,  9 Jul 2023 15:11:19 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dorminy.me; s=mail;
	t=1688929879; bh=i0KcUcAyrGMIC1rkAvJHWWPwsKlFh9C7E3KShPZecpQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oo8IDL8XqaHj3bGBhvjQfENN5Ee72LRs67AvdUbUO+7V4VDUQXYLzM6kf1jWcbJsE
	 V7Vb83oSR6WcmigNexRIBvDekSWaqcol0RMJuF7ud6aFYqZazAo4wY7ThYEUuBa1V/
	 QxX+HeLjIEY6gruVPj2k0/yXgctsNOSsfs8gOEePnOhenNitPKp1BCMSgKmdEknu7V
	 CMx73XboatsZBkmWuoHOeO8o+C+dmRcMS1h/ooL23Ip/mtMuQDPObwwVcmUmu6qO/B
	 s2Ez94WLtxxz3OEH5hnQlg9uQ0Y1OSaUnaIETFJeHEEZOSM8wPr5OFk5n/LVg0ICmN
	 ZMe5OT1fN/Hlw==
From: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>
To: linux-btrfs@vger.kernel.org,
	fstests@vger.kernel.org,
	kernel-team@meta.com,
	ebiggers@google.com,
	anand.jain@oracle.com,
	fdmanana@suse.com,
	linux-fscrypt@vger.kernel.org,
	fsverity@lists.linux.dev,
	zlang@kernel.org
Cc: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>
Subject: [RFC PATCH v2 3/8] common/encrypt: add btrfs to get_ciphertext_filename
Date: Sun,  9 Jul 2023 15:11:06 -0400
Message-Id: <023efcfc72f3ebe66ed66513529c207334ab9eea.1688929294.git.sweettea-kernel@dorminy.me>
In-Reply-To: <cover.1688929294.git.sweettea-kernel@dorminy.me>
References: <cover.1688929294.git.sweettea-kernel@dorminy.me>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the relevant call to get an encrypted filename from btrfs.

Signed-off-by: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>
---
 common/encrypt | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/common/encrypt b/common/encrypt
index fc1c8cc7..2c1925da 100644
--- a/common/encrypt
+++ b/common/encrypt
@@ -618,6 +618,19 @@ _get_ciphertext_filename()
 	local dir_inode=$3
 
 	case $FSTYP in
+	btrfs)
+		# Extract the filename from the inode_ref object, similar to:
+		# item 24 key (259 INODE_REF 257) itemoff 14826 itemsize 26
+		# 	index 3 namelen 16 name: J\xf7\x15tD\x8eL\xae/\x98\x9f\x09\xc1\xb6\x09>
+		#
+		$BTRFS_UTIL_PROG inspect-internal dump-tree $device | \
+			grep -A 1 "key ($inode INODE_REF " | tail -n 1 | \
+			perl -ne '
+				s/.*?name: //;
+				chomp;
+				s/\\x([[:xdigit:]]{2})/chr hex $1/eg;
+				print;'
+		;;
 	ext4)
 		# Extract the filename from the debugfs output line like:
 		#
@@ -715,6 +728,9 @@ _require_get_ciphertext_filename_support()
 			_notrun "dump.f2fs (f2fs-tools) is too old; doesn't support showing unambiguous on-disk filenames"
 		fi
 		;;
+	btrfs)
+		_require_command "$BTRFS_UTIL_PROG" btrfs
+		;;
 	*)
 		_notrun "_get_ciphertext_filename() isn't implemented on $FSTYP"
 		;;
-- 
2.40.1

