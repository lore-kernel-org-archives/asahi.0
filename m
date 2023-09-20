Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B633AC2E
	for <asahi@lists.linux.dev>; Wed, 20 Sep 2023 14:07:03 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-773ca5c1503so240898985a.2
        for <asahi@lists.linux.dev>; Wed, 20 Sep 2023 07:07:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695218822; x=1695823622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y/W4N5r426GKb9x1dneBJYVT4qJsb+kwhD7PIIfH2cA=;
        b=lHY9Ks07RN53IFVc8uBNAgd8ktFPhNl6aVgSMGCWocvGIlO9V1krjiFztZarjZrQYA
         E/+qt1b3BWEESauDXoo4bNIBWVH5wntwgkSgLGh3YPz4ZG9h8tcH3lwX5ZliCnd9ldsU
         U5/f6mNHQUCTPBeEWcOG1eVAaLa1eENNh43Tri8esbhGzInXvGvrK1QBVJtxcil+NCkE
         Empih/dMvZaCH5DSPCIqPyzLPMh5uTT3QdbcT42LSaEpi8yUPVhPpSjJWpZxPcUiz0ZV
         Sq3p3bzGPwwVM0NrthnPhTGyj3+7nb9JWz9nNjeemy/G9IdTiOezifS35MFnuiWnqfx0
         X58A==
X-Gm-Message-State: AOJu0YxEnRlUuZmclGbg4bLkjJhWCv+1bAgWXsIpB52jZkAeUKcJ4J3Z
	rsrs0xPl4XA0XI8sXgxwq3k=
X-Google-Smtp-Source: AGHT+IGt/gXIL3E8KsfDBSN3PzrNo2mxFinif+HNB4o1UFl9Rr3eOyrdjvzhYA3ko4Bz5kwdAoO7gA==
X-Received: by 2002:a05:6214:716:b0:649:cbd0:8127 with SMTP id c22-20020a056214071600b00649cbd08127mr2149035qvz.57.1695218822560;
        Wed, 20 Sep 2023 07:07:02 -0700 (PDT)
Received: from Belldandy-Slimbook.tail03774.ts.net (ool-18e49371.dyn.optonline.net. [24.228.147.113])
        by smtp.gmail.com with ESMTPSA id v1-20020a0cdd81000000b006589375b888sm345447qvk.67.2023.09.20.07.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 07:07:01 -0700 (PDT)
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
Subject: [PATCH v2 1/1] btrfs-progs: mkfs: Enforce 4k sectorsize by default
Date: Wed, 20 Sep 2023 10:06:14 -0400
Message-ID: <20230920140635.2066172-2-neal@gompa.dev>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230920140635.2066172-1-neal@gompa.dev>
References: <20230920140635.2066172-1-neal@gompa.dev>
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
index c762b6a3..c9c42341 100644
--- a/Documentation/Subpage.rst
+++ b/Documentation/Subpage.rst
@@ -9,18 +9,19 @@ to the exactly same size of the block and page. On x86_64 this is typically
 pages, like 64KiB on 64bit ARM or PowerPC. This means filesystems created
 with 64KiB sector size cannot be mounted on a system with 4KiB page size.
 
-While with subpage support systems with 64KiB page size can create
-and mount filesystems with 4KiB sectorsize.  This still needs to use option "-s
-4k" option for :command:`mkfs.btrfs`.
+Since v6.6, filesystems are created with a 4KiB sectorsize by default,
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
+Subpage support is used by default for systems with a non-4KiB page size since v6.6.
 
 Please refer to status page of :ref:`status-subpage-block-size` for
 compatibility.
diff --git a/Documentation/mkfs.btrfs.rst b/Documentation/mkfs.btrfs.rst
index 1fca7448..034473f4 100644
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
+                Versions prior to 6.6 set the sectorsize matching to the page size.
 
 -L|--label <string>
         Specify a label for the filesystem. The *string* should be less than 256
diff --git a/mkfs/main.c b/mkfs/main.c
index 1c5d668e..bd2e4350 100644
--- a/mkfs/main.c
+++ b/mkfs/main.c
@@ -1204,7 +1204,7 @@ int BOX_MAIN(mkfs)(int argc, char **argv)
 	}
 
 	if (!sectorsize)
-		sectorsize = (u32)sysconf(_SC_PAGESIZE);
+		sectorsize = (u32)SZ_4K;
 	if (btrfs_check_sectorsize(sectorsize))
 		goto error;
 
-- 
2.41.0

