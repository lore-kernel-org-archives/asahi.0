Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A9821CC5C
	for <asahi@lists.linux.dev>; Thu, 30 Jul 2026 00:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785372534; cv=none; b=UBWoMJqdSeIhMwP7/ZJP8PmuFdDjU5YLka+X+ahVUK+vdTe2lmBslya731ED9/3kRxI+3QyKOKHwL5G7izAoKNRwgpMR9UcXH8yuzT5ziOgVvO9SyegYvvOWqxW56e+9LPCoTBBPcb9FmtkrhMyLCX2rs6KyJeXruoP2YTXvpIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785372534; c=relaxed/simple;
	bh=sfBkuWG7cp9oC7rWjia696a5/wki/gR86QMS5y8V1LA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JUgRtk+AK4kAu+J4FTQM5arKXhVsH1PAoPU8s+KCcBWPHckts0bAip1lR75oP+FwXLxloPTQKOeBdbkDMMyDaN7vDba+CT5eZnyjdrBs/dL23lj5KDMBkVBZ7lveQJ3YsqjUSIozjKCop2ksn7udq2caJv5gnCHzhHBC7idIKy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-92ed3993c1eso97313485a.1
        for <asahi@lists.linux.dev>; Wed, 29 Jul 2026 17:48:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785372530; x=1785977330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=amG5+bslRdnIMjojUGahI0L8Zbj6b4FQtBhaxO9WyM8=;
        b=OLAFvh5F1p6vdUEpQZc0cFbrCD138jiazyE/R8MhW0vuqcXXHKay/2NmNxcPF12b/G
         TGjw4GihC4suGMHyGrhZlIH8W9w0q/IHr86jk8um1cNckXnU26K8m9+MU6tDDRd/wxpW
         iOJeRlWfJFwceVacRdSC4oVIJ58HQ9jj7fV2ERV0EFc+kxZvBpbeoYbxYlaizazbUMUH
         CmFF3784e9BEtRObCdlD7P8LHFVB3G0CY/+UEwQPlafX8fr7UpzCmaeebz6qgj3cCNPe
         qq6Fnk0qZkzzOHxbmNbkP8roPBOz1z90cUxRASvc8SipfQk0kPLHMlr42w5T7rVOrd4q
         WQFg==
X-Gm-Message-State: AOJu0YwZqNPDQT+4ytf5xHSMSzyP0gFu++leUuCr0TbvXwt5yBJUqfhz
	J8IiAxCJrzmCyl4mG3+TVpLJkbyd47ovqWs1MOsLr6Mbgx+Fwk06A/CX
X-Gm-Gg: AR+sD11a7cEw4UZyfkdLr2ds7XZxpOXBLuCH18EPpUpquAUlSLdC3q3gOKFG3TGFogg
	tW783dNYfUe2GrqP2xKgiFFwiOwhjsa2rFhZliPlXaUGa4aRiXLQ0D9Tl1Eu5lnYblt078qha99
	sAe0AXXnGsP9GDCGInSvuukvWasUxjKUJFkiuJ2J6hyhmIGx2iOWmfsmcPihetX7aC0zuWXbCWH
	bYugx2RFvzkAn5LPguaZOgz93raOYapL55yzP6RwG/PS8iJltykDyrEl9OBC2ZL5U/7o+o4a4oe
	3F5xoEJsTVG+aCBRZkCQ1uTdED9T6TKUhUaydglgQfiNbScGKrza4RKFjOMtKhBQmEKDrxt/Vuq
	h5faJXVK4kG25G0eRBL60wD4PFLFi2gWv/IbN3iEGIu8NQS/EV+epjQFLF79Q+rDiMI6uzvfD34
	b5Gb8Dgxk2x3WjxhkNFVfwfXVVIhXxBuu3sU2iWejY3neMbehG+tUxplIq+EPXUGUWWpcIFZOyF
	EnZ3iR4KZIOCCsfpWDn5u6aMUmRRWSxt7VU3Gf7dhhDJ88Xm3ok4SHdz/5QMeXq0S2+mhR7Fe8Y
	fTkK6Zl7SZjFdaASXC5H0NHNkw==
X-Received: by 2002:a05:620a:a40b:10b0:928:f440:2dc7 with SMTP id af79cd13be357-93485fd24edmr41612585a.35.1785372530378;
        Wed, 29 Jul 2026 17:48:50 -0700 (PDT)
Received: from Skuld-Framework.tail03774.ts.net ([32.221.37.233])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-933d3225b17sm290329985a.8.2026.07.29.17.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 17:48:49 -0700 (PDT)
From: Neal Gompa <neal@gompa.dev>
To: Danilo Krummrich <dakr@kernel.org>,
	Russ Weight <russ.weight@linux.dev>,
	Luis Chamberlain <mcgrof@kernel.org>
Cc: asahi@lists.linux.dev,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	Sven Peter <sven@svenpeter.dev>,
	Janne Grunau <j@jannau.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Neal Gompa <neal@gompa.dev>
Subject: [PATCH] firmware_loader: Add /lib/firmware/vendor paths for Apple ARM platforms
Date: Wed, 29 Jul 2026 20:42:58 -0400
Message-ID: <20260730004759.3089449-1-neal@gompa.dev>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Apple ARM machines (branded Apple Silicon Macs), there is
non-redistributable firmware provided in macOS that is required
for Linux to leverage the hardware to run properly.

The firmware covers Wi-Fi+BT support, USB, hardware ISP, the touchbar
touchscreen, and the trackpad.

In order to ensure this firmware can be installed without messing
with firmware provided by linux-firmware and other packages that
put things in the tree, the empty "vendor" subdirectory was created
to serve this purpose. This directory is used by the asahi dracut
module as part of the Asahi Linux installation process to transfer
firmware from macOS to the newly installed Linux system.

This is based on the patch originally written by Hector Martin
for Asahi Linux.

Link: https://asahilinux.org/docs/platform/introduction/
Signed-off-by: Neal Gompa <neal@gompa.dev>
---
 Documentation/driver-api/firmware/fw_search_path.rst | 2 ++
 drivers/base/firmware_loader/main.c                  | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/driver-api/firmware/fw_search_path.rst b/Documentation/driver-api/firmware/fw_search_path.rst
index d7cb1e8f0076..ddd945a47fed 100644
--- a/Documentation/driver-api/firmware/fw_search_path.rst
+++ b/Documentation/driver-api/firmware/fw_search_path.rst
@@ -6,6 +6,8 @@ The following search paths are used to look for firmware on your
 root filesystem.
 
 * fw_path_para - module parameter - default is empty so this is ignored
+* /lib/firmware/vendor/UTS_RELEASE/
+* /lib/firmware/vendor/
 * /lib/firmware/updates/UTS_RELEASE/
 * /lib/firmware/updates/
 * /lib/firmware/UTS_RELEASE/
diff --git a/drivers/base/firmware_loader/main.c b/drivers/base/firmware_loader/main.c
index 24213a0ea831..1acc5842fb24 100644
--- a/drivers/base/firmware_loader/main.c
+++ b/drivers/base/firmware_loader/main.c
@@ -471,6 +471,8 @@ static int fw_decompress_xz(struct device *dev, struct fw_priv *fw_priv,
 static char fw_path_para[256];
 static const char * const fw_path[] = {
 	fw_path_para,
+	"/lib/firmware/vendor/" UTS_RELEASE,
+	"/lib/firmware/vendor",
 	"/lib/firmware/updates/" UTS_RELEASE,
 	"/lib/firmware/updates",
 	"/lib/firmware/" UTS_RELEASE,
-- 
2.55.0

