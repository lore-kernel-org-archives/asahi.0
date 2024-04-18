Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF5917AD8D
	for <asahi@lists.linux.dev>; Thu, 18 Apr 2024 19:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713466830; cv=none; b=GDOaIOhp5ST+mKL7h2U3/FAsIHJT5HxAhderwRVZv+WkGTor7YGcPcDH/xtb+ezeOIrkq344/t28dUDp8FHPifeV6P1Y1YdCPufKKb15heapsK8B4MiFbLJ5pdGKEzEbCQWmUPwltfWzmsdsjoCpyCe/VO+neacyTeXt4ACoDyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713466830; c=relaxed/simple;
	bh=RIMrzIgyJNsKDdkG30ykeJxK7kmqXZzvJXb9obb7yIc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pFGnG67KuUfAgAlqsbZdswxCAE0sugV2Miqh3wAIVK1pUI+eBlB9ZgZTFsqpAI8dNBO3J+tv4bCZF2Ca06Lfor4ByPBP/NrjvoY0RdLGkuG6Mxm8rHla1mfjxe5NoYdZYuX54IidFmH6lq6/EsMkzt2dOpO9QjCIc8cJozLYz1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jYC9hxnD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jYC9hxnD"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D1F15C116B1;
	Thu, 18 Apr 2024 19:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713466829;
	bh=RIMrzIgyJNsKDdkG30ykeJxK7kmqXZzvJXb9obb7yIc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jYC9hxnDWZaTpAzTSi18lBfVPhWwN7h7umZv/zdwWf0558KGgV/+sU73fT+DI4dKW
	 Eodng640LyfDJxABxxJ6WDFcAxHM6mju0MlEbkIHd95hc96pv8kLKbsL7lsduq4hKa
	 4KKAjXvV5rtovcvcg31A44m1CAAvuT9pijR170JnJaMtejXJ3ZC3zFguKrB/BBP383
	 6eP8fMOiCHR2muaoxoXxnhvNi7Eowtv6lQy/jKe+kTY5UQGtobecmkiU/+qDZZjD1x
	 qeowGT8yevrxu+Eoe4cv38bzg23sJlhQNtBKqk9e0NUiBdy+V7jOmTJjMNL+aLZMJG
	 Gt3f19KXAinFQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C02B0C05023;
	Thu, 18 Apr 2024 19:00:29 +0000 (UTC)
From: Janne Grunau via B4 Relay <devnull+j.jannau.net@kernel.org>
Date: Thu, 18 Apr 2024 21:00:26 +0200
Subject: [PATCH v2 2/5] configs: apple: Use "vidconsole,serial" as
 stdout/stderr
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240418-apple_config-v2-2-7e5c6b9a9db3@jannau.net>
References: <20240418-apple_config-v2-0-7e5c6b9a9db3@jannau.net>
In-Reply-To: <20240418-apple_config-v2-0-7e5c6b9a9db3@jannau.net>
To: Mark Kettenis <kettenis@openbsd.org>, Tom Rini <trini@konsulko.com>
Cc: Simon Glass <sjg@chromium.org>, u-boot@lists.denx.de, 
 asahi@lists.linux.dev, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=904; i=j@jannau.net;
 h=from:subject:message-id;
 bh=pYGw3Rvsr83Yc8ZaQ99xyUt7JbaiOW2b/6U7j6EjC9k=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhjTF3NN9cRuTa14bdceZaN24ns2/uiDgYl3kvf/l1bt/S
 Su1mWzuKGVhEONikBVTZEnSftnBsLpGMab2QRjMHFYmkCEMXJwCMBHTZoZ/Wl/vbTHY+N97ktKW
 A49nJcXWXhU3inaeXSO1OWfnxnlM/Az/HVcyff0xST79Y8lHowUrmWoc9RaJ1zPJPJ2n1Vrxw1G
 EBwA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-Endpoint-Received: by B4 Relay for j@jannau.net/default with auth_id=62
X-Original-From: Janne Grunau <j@jannau.net>
Reply-To: j@jannau.net

From: Janne Grunau <j@jannau.net>

The display size querying in efi_console relies on this order. The
display should be the primary output device and should be used to
display more than 80x25 chars.

Reviewed-by: Mark Kettenis <kettenis@openbsd.org>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Janne Grunau <j@jannau.net>
---
 include/configs/apple.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/configs/apple.h b/include/configs/apple.h
index 0576bc04c9..a70440b3ad 100644
--- a/include/configs/apple.h
+++ b/include/configs/apple.h
@@ -6,8 +6,8 @@
 /* Environment */
 #define ENV_DEVICE_SETTINGS \
 	"stdin=serial,usbkbd,spikbd\0" \
-	"stdout=serial,vidconsole\0" \
-	"stderr=serial,vidconsole\0"
+	"stdout=vidconsole,serial\0" \
+	"stderr=vidconsole,serial\0"
 
 #if IS_ENABLED(CONFIG_CMD_NVME)
 	#define BOOT_TARGET_NVME(func) func(NVME, nvme, 0)

-- 
2.44.0


