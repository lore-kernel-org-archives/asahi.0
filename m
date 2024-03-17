Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13631BF33
	for <asahi@lists.linux.dev>; Sun, 17 Mar 2024 14:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710687289; cv=none; b=dK118hxbQcEqmOfRfiuqkwTiOTXa5erKQhR4MEyqIOwCmcq8i/eXF0DLSHaZ37JfrVRVOfquvlMeoBjJSd3LlVLGadbHTKB6Q6W3TlwVz5/Jp8815q2duhJ7YJyqIq9kPHRgGZkI2q5hSK1mBV7gateM+e91Pkd+dsJx8duVA1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710687289; c=relaxed/simple;
	bh=Z2mfsCTlO8uO44C+Yol6qT6hc2wvX6pkAvLR6EowyWk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ezwf8dJcHQZ6qZfHrAXL0vsrnyddiK+vBZ6w8p0B2leWl2j0hI6uYE1GFKM1mpfzScqb3rqKyuP6r/xMzpbZwam6Fp480hyQybzrFrO25fZB3ATCCxRbXScZBJ9tHq1HH0DopJRZPIpSSuciz7AYiQVZu6+PUMpVQ+AzoK2+x5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=raHplJNa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="raHplJNa"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 81B75C433C7;
	Sun, 17 Mar 2024 14:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710687289;
	bh=Z2mfsCTlO8uO44C+Yol6qT6hc2wvX6pkAvLR6EowyWk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=raHplJNahlwtIXKOZ3cO6maMF454fdqWhdGXr9m33h0pvpz6r+WAdmSVTEt7c/1Un
	 ZH0JT3GtoW5MpKXIXTGRiuuElDdDXUv8bZ+mBwcS33v/Ruz7OSAHap6hLwFVfgle3g
	 KTppERwB6q965UDmQ1RjnwF05rcfchbpZdOf4Zgy90sellxnvxSVB1Qel2dcGC4xqT
	 Jpys1yyhdBJJ7KCD1xsYD6ACvD1QMvmxxyPPZkuVlzk6FLLHfkrnzZhcH7ZNy9Mq4d
	 8mtNYzby0VB1e8beC+Y5vtzzEOnPvEOv5BAgPvu6aghbF88IcKfzXHBv18XQcgqpQ0
	 TJf1ywq4hKdIg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ED44C54E71;
	Sun, 17 Mar 2024 14:54:49 +0000 (UTC)
From: Janne Grunau via B4 Relay <devnull+j.jannau.net@kernel.org>
Date: Sun, 17 Mar 2024 15:54:48 +0100
Subject: [PATCH 2/4] configs: apple: Use "vidconsole,serial" as
 stdout/stderr
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240317-apple_config-v1-2-1b862bc140a9@jannau.net>
References: <20240317-apple_config-v1-0-1b862bc140a9@jannau.net>
In-Reply-To: <20240317-apple_config-v1-0-1b862bc140a9@jannau.net>
To: Mark Kettenis <kettenis@openbsd.org>, Tom Rini <trini@konsulko.com>
Cc: Simon Glass <sjg@chromium.org>, u-boot@lists.denx.de, 
 asahi@lists.linux.dev, Janne Grunau <j@jannau.net>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=811; i=j@jannau.net;
 h=from:subject:message-id; bh=xRd+NgmurhsE0y/QsMQndq65xM1784gn3CH0uS+KJcY=;
 b=kA0DAAoWoRs8240vZWYByyZiAGX3BDejycIr/yrWDpJuXUDTC/BljVdi36A6LPw2o2iz/Hibq
 Ih1BAAWCgAdFiEEYivpiACrfCFcfeBWoRs8240vZWYFAmX3BDcACgkQoRs8240vZWbhqAEAuXlN
 GmRMlrTBtvWerMAtw5s8j5l5JoPezYtNXWRU/QIBAMeW7g+GDDAe42V3LBn2Hl6ioFiofc9Y0IY
 G6O0dQOUJ
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-Endpoint-Received: by B4 Relay for j@jannau.net/default with auth_id=62
X-Original-From: Janne Grunau <j@jannau.net>
Reply-To: <j@jannau.net>

From: Janne Grunau <j@jannau.net>

The display size querying in efi_console relies on this order. The
display should be the primary output device and should be used to
display more than 80x25 chars.

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

