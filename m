Received: from gimli.kloenk.de (gimli.kloenk.de [49.12.72.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B75233723
	for <asahi@lists.linux.dev>; Thu,  5 Feb 2026 15:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.12.72.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770304356; cv=none; b=ELBkHjrR8TphKjbLLRToCZKsfdGcSHgKZiya0x0tHzaX5gibdwRoHYbUt+1QYVE5lq4xB8mVovpOQeH+WnkaXp9yQiPNBaFymSraTMQuVkqZrSWzoMuQCzFKtvt95Y7R0cQyHOfgxvsigkv3zZPgMAIRo/tY8iUJrQehEdRC8wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770304356; c=relaxed/simple;
	bh=QyWy3+iyStDEjoaS0YtNRwaQmr0a+SCE1P+JPPgqh0c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=b8woCiwVre4nRlcBZMk7uA4dPmV8yERrLMFNPd2z+c0yICf2WXDC4vb84kNl6bwCGbJsv/TwxS2bsM0Sj1/VYq7mN8kD40xURFUckapq4PxQAu50Ojdwc1Q4KxM45oriai0NltoKPmJ77ymXcL2GJ2lMVaLG9jfmK8zMDpgc7SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev; spf=pass smtp.mailfrom=kloenk.dev; dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b=ZYaQT6dT; arc=none smtp.client-ip=49.12.72.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b="ZYaQT6dT"
From: Fiona Behrens <me@kloenk.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kloenk.dev; s=mail;
	t=1770303748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MIuqsclWivSq8X0tmbNbBipQig0B2w6faVAPAXDfKr8=;
	b=ZYaQT6dT51iaaRL3EevD0C645xpiF/BJsoIKw2gSNNVdN2lL8sRo9uUpvs7pGT6CxvNujp
	DLuE7G5CfStcuoiVqq3m+hCd0Jv0tafcnmlxib1cIrCm11YKKomqAF5yHcIW85uMWoSO/W
	xKCE1s8BPIyDwLYKVs7nA2Tfp1EaXe4=
Date: Thu, 05 Feb 2026 15:02:16 +0000
Subject: [PATCH] rust: iio: common: Change cfg guard of aop_sensors module
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260205-asahi-iio-aop-cfg-v1-1-c83e3b00fd0e@kloenk.dev>
X-B4-Tracking: v=1; b=H4sIAPewhGkC/x3NwQqDMBCE4VeRPXchpkTBVxEPaVzNXIxkRVok7
 97o8Tv8MxepZIjS0FyU5YQibRXtq6EQ/bYKY64ma2xnrHHs1UcwkNinncOycj8H9+56cR8Rqt2
 eZcH32Ryn6gg9Uv7dF6WUP3O5fCVyAAAA
X-Change-ID: 20260205-asahi-iio-aop-cfg-7dc5367e5bee
To: Janne Grunau <j@jannau.net>, Sven Peter <sven@kernel.org>, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: asahi@lists.linux.dev, Fiona Behrens <me@kloenk.dev>

Change the cfg guard of the `aop_sensors` module to the direct config
symbols `CONFIG_IIO_AOP_SENSORS_LAS` and `CONFIG_IIO_AOP_SENSORS_ALS`
without checking if they are set as either module or yes.

This fixes a build error when `CONFIG_IIO_AOP_SENSORS_LAS` is set to
module and `CONFIG_IIO_AOP_SENSORS_ALS` is disabled.

Signed-off-by: Fiona Behrens <me@kloenk.dev>
---
The old cfg seem to be created due to a copy past error where two times
the same cfg is checked.

This is meant for the asahi downstream kernel as the iio rust mod is not
yet part of the upstream rfl kernel.
---
 rust/kernel/iio/common/mod.rs | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/rust/kernel/iio/common/mod.rs b/rust/kernel/iio/common/mod.rs
index 570644ce0938..b789e9bf44c9 100644
--- a/rust/kernel/iio/common/mod.rs
+++ b/rust/kernel/iio/common/mod.rs
@@ -2,10 +2,5 @@
 
 //! IIO common modules
 
-#[cfg(any(
-    CONFIG_IIO_AOP_SENSOR_LAS = "y",
-    CONFIG_IIO_AOP_SENSOR_ALS = "m",
-    CONFIG_IIO_AOP_SENSOR_LAS = "y",
-    CONFIG_IIO_AOP_SENSOR_ALS = "m",
-))]
+#[cfg(any(CONFIG_IIO_AOP_SENSOR_LAS, CONFIG_IIO_AOP_SENSOR_ALS,))]
 pub mod aop_sensors;

---
base-commit: f1879b3d78dcf69a8ff9be3b504c1bd6d5fa2f47
change-id: 20260205-asahi-iio-aop-cfg-7dc5367e5bee

Best regards,
-- 
Fiona Behrens <me@kloenk.dev>

