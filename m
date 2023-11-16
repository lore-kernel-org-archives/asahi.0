Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2997A328AC
	for <asahi@lists.linux.dev>; Thu, 16 Nov 2023 14:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-677a0ac3797so4810076d6.1
        for <asahi@lists.linux.dev>; Thu, 16 Nov 2023 06:59:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700146793; x=1700751593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gzn6gpBv9OleWUEhEJCmZq93KrA6r6P5N/PbiyoQ8dg=;
        b=aVRovpmAH3ljfXvSzBxlHfdYjBMCzvKJGocMxinAQCIoX7wB1Z79NZM4M4zbMgamag
         JvxK8K1F5kqHMJj60zedC5E0nNXztqVQ7itfa5OGCvPqu4rWzzQ9jxYl/d4y/1YOEyIg
         RAdUBfqZoFWhkiNDyOB+csVvYTuNfvlfE1bC01H6nC50/KPqjLmR5Jxm7U0MvMfaPND9
         POJN2m12VKI4m5/+DS1iJ7CvfFBBtCfP4z376SU9oUQPyzG5WPBC0EAL2U+gGxj6DRgd
         ylAw0KG5P1v1DLkHWwFPzcgJ5jh8iv+6483vh1CcsSwMzzFP2kIm4aO0Rf4NYb1VKb2h
         oBVw==
X-Gm-Message-State: AOJu0YwJ3Bt4mUmudUTeDwEpO7/6pBf6SpYabTS/CYizSXkCX5oE/EOY
	OJWbYCzIBFjovz80hW7rs4I=
X-Google-Smtp-Source: AGHT+IFsc1L7dZLVky6JG27YWbZMZdmCmdpQOIwkKx4Dtr268ZSra5TL6Kvaylf0pKgV6UgF5wmZgQ==
X-Received: by 2002:ad4:550e:0:b0:66d:3716:4e14 with SMTP id pz14-20020ad4550e000000b0066d37164e14mr8164645qvb.4.1700146792870;
        Thu, 16 Nov 2023 06:59:52 -0800 (PST)
Received: from Belldandy-Slimbook.infra.opensuse.org (ool-18e49371.dyn.optonline.net. [24.228.147.113])
        by smtp.gmail.com with ESMTPSA id m1-20020ad44d41000000b00670c7fd09cbsm1430642qvm.95.2023.11.16.06.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 06:59:52 -0800 (PST)
From: Neal Gompa <neal@gompa.dev>
To: Linux BTRFS Development <linux-btrfs@vger.kernel.org>
Cc: Neal Gompa <neal@gompa.dev>,
	Anand Jain <anand.jain@oracle.com>,
	Qu Wenruo <quwenruo.btrfs@gmx.com>,
	Qu Wenruo <wqu@suse.com>,
	David Sterba <dsterba@suse.cz>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Davide Cavalca <davide@cavalca.name>,
	Jens Axboe <axboe@fb.com>,
	Asahi Lina <lina@asahilina.net>,
	Asahi Linux <asahi@lists.linux.dev>,
	Josef Bacik <josef@toxicpanda.com>
Subject: [PATCH v3] btrfs-progs: mkfs: Enforce 4k sectorsize by default
Date: Thu, 16 Nov 2023 09:50:59 -0500
Message-ID: <20231116145933.2707486-2-neal@gompa.dev>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231116145933.2707486-1-neal@gompa.dev>
References: <20231116145933.2707486-1-neal@gompa.dev>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We have had working subpage support in Btrfs for many cycles now.
Generally, we do not want people creating filesystems by default
with non-4k sectorsizes since it creates portability problems.

Signed-off-by: Neal Gompa <neal@gompa.dev>

Reviewed-by: Anand Jain <anand.jain@oracle.com>
Reviewed-by: Qu Wenruo <wqu@suse.com>
Reviewed-by: Josef Bacik <josef@toxicpanda.com>
---
 Documentation/Subpage.rst    | 17 +++++++++--------
 Documentation/mkfs.btrfs.rst | 13 +++++++++----
 mkfs/main.c                  |  2 +-
 3 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/Documentation/Subpage.rst b/Documentation/Subpage.rst
index c762b6a3..1655ae7e 100644
--- a/Documentation/Subpage.rst
+++ b/Documentation/Subpage.rst
@@ -9,18 +9,19 @@ to the exactly same size of the block and page. On x86_64 this is typically
 pages, like 64KiB on 64bit ARM or PowerPC. This means filesystems created
 with 64KiB sector size cannot be mounted on a system with 4KiB page size.
 
-While with subpage support systems with 64KiB page size can create
-and mount filesystems with 4KiB sectorsize.  This still needs to use option "-s
-4k" option for :command:`mkfs.btrfs`.
+Since v6.7, filesystems are created with a 4KiB sectorsize by default,
+though it remains possible to create filesystems with other page sizes
+(such as 64KiB with the "-s 64k" option for :command:`mkfs.btrfs`). This
+ensures that new filesystems are compatible across other architecture
+variants using larger page sizes.
 
 Requirements, limitations
 -------------------------
 
-The initial subpage support has been added in v5.15, although it's still
-considered as experimental, most features are already working without problems.
-On a 64KiB page system filesystem with 4KiB sectorsize can be mounted and used
-as usual as long as the initial mount succeeds. There are cases a mount will be
-rejected when verifying compatible features.
+The initial subpage support has been added in v5.15. Most features are
+already working without problems. On a 64KiB page system, a filesystem with
+4KiB sectorsize can be mounted and used as long as the initial mount succeeds.
+Subpage support is used by default for systems with a non-4KiB page size since v6.7.
 
 Please refer to status page of :ref:`status-subpage-block-size` for
 compatibility.
diff --git a/Documentation/mkfs.btrfs.rst b/Documentation/mkfs.btrfs.rst
index 7e23b9f6..be4f49cb 100644
--- a/Documentation/mkfs.btrfs.rst
+++ b/Documentation/mkfs.btrfs.rst
@@ -122,10 +122,15 @@ OPTIONS
 -s|--sectorsize <size>
         Specify the sectorsize, the minimum data block allocation unit.
 
-        The default value is the page size and is autodetected. If the sectorsize
-        differs from the page size, the created filesystem may not be mountable by the
-        running kernel. Therefore it is not recommended to use this option unless you
-        are going to mount it on a system with the appropriate page size.
+        By default, the value is 4KiB, but it can be manually set to match the
+        system page size. However, if the sector size is different from the page
+        size, the resulting filesystem may not be mountable by the current
+        kernel, apart from the default 4KiB. Hence, using this option is not
+        advised unless you intend to mount it on a system with the suitable
+        page size.
+
+        .. note::
+                Versions prior to 6.7 set the sectorsize matching to the page size.
 
 -L|--label <string>
         Specify a label for the filesystem. The *string* should be less than 256
diff --git a/mkfs/main.c b/mkfs/main.c
index d984c995..0570c8f8 100644
--- a/mkfs/main.c
+++ b/mkfs/main.c
@@ -1384,7 +1384,7 @@ int BOX_MAIN(mkfs)(int argc, char **argv)
 	}
 
 	if (!sectorsize)
-		sectorsize = (u32)sysconf(_SC_PAGESIZE);
+		sectorsize = (u32)SZ_4K;
 	if (btrfs_check_sectorsize(sectorsize))
 		goto error;
 
-- 
2.41.0

