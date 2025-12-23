Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37B6320CAC
	for <asahi@lists.linux.dev>; Tue, 23 Dec 2025 14:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766499264; cv=none; b=pLqVpM5bXEWAMUDn6Zp/kIFvR/kryuWzxyXo4KViPJZwSKm2GeemL3aWlrGIuP8Z4BTMwlVuxppeK8x2eAPRWmN/0jVOp+naQFehHSgE4x+31ykcisdHSwR0RY4Uu8IjW8hAltWAYHnpD+lOITPzngGKXvtIs/kMQGvqnWx4njo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766499264; c=relaxed/simple;
	bh=M8K2zyn6hgbZbYWDWq9d9LHWwqY0uxaEJ1APjbEF8uc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bExVWbqJJCjdrTJRqXKUarImELpbqYPp3FzCJqexG+2ZD6XSRnV7f87VYfi1fnHDE1RstUXYuF+u6UNuySaitG4S0FBMY+kn47ERq6PwZxrQOERBAWy7F5FnZLrN/C5D7POb+ItDqsK7PNgw0fgDhnh5AVq3YZEOZ0JHxm0Ah0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GiaZ/xAQ; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GiaZ/xAQ"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a0c20ee83dso63520685ad.2
        for <asahi@lists.linux.dev>; Tue, 23 Dec 2025 06:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766499261; x=1767104061; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FzbzO6CJwLccPfkWtJ0+CvDng44py3nFdjMzI7Msc48=;
        b=GiaZ/xAQw5Wjyw8NRjIcBE8lr9nBH5CcIq80sOA9HiQ4/WVJcugM52++PnvLbmBeBS
         jd2juh657GxTZU/pyGjrfDrDuybruAi+/LMrA6iNwygdHxbrlFO3GZxkaMorjrgP5XBh
         rLQfRQQSp5dCn/eUMbew+4dE1i1ewufjhy9U9QI/yqzwwfOFdeXx/0ERVg6ILu6Bn734
         3jRSGzprNIwne3Ve0m4I+GHqdZ8/sysOhmGMJKZi8teZslA8yoQacM4YzBC8E5trh0kB
         3YDKBBtGxFBg3czbQxAyjbd5QWVgQx6r8tktRekkWWKIVJKvPAYH0OGhc1YOlJE9hIm/
         4PYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766499261; x=1767104061;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FzbzO6CJwLccPfkWtJ0+CvDng44py3nFdjMzI7Msc48=;
        b=lrLacilgbCan5JBtsd1dDlufy1LiEuNTwiRBv9eIup1D17YZ7qlcAO1+Xu/jsB6ig3
         Hvhc7PEMGVLSqZKf9ZyQM7zrUPwOcM6zZF5iIsiRL83qt4PDcxt7vWoNJNE1xHtxsmPQ
         W1JYUSRGDMYT7XymlHZYdLUjO/O8S3WVkMB0hQp5Nlh4EXBQCNqQhVY/5DV7gIsHAARK
         7BsHqUFYijpDObL/Q9AB/JOdYrzOBmWqDUNbpblrETjNKDVz08VtGd5KuYeyzTWGvNNb
         eIH4/m2YrfxJwxeIvlhH0Ak9orZxNTQU/7VYb8yhcmikH0e8EZy7nMn5IPRFo/Fjfbf3
         jb4Q==
X-Gm-Message-State: AOJu0YxYZcv8ZZRWmuEhAsdnjFxTr/bxKBRl8sjiB05KPnnBe71hFSQn
	LT+xqahjwmtDfDmQaAN8nF1AZYRM7C8UcC7ZlB2qrC9o8il7tLtCCjWO
X-Gm-Gg: AY/fxX5j8M8raUqIqbh0o4+feSgvxX3LZvAcWIX1F4/7dHHfpJTWJLLLzzZEgIJIoqf
	gMs6hhB9RnO9jlHkxvXK4mYeW+oaVkFjJlEll3SHZtEFZVL/zoEvBxkOG+jAjtUhvrS8q1d2ZuF
	Jm+IXxIftRwIITrZA0LBEfEMfn4EMi80CojUkuKzHJ4HIqhvUCieG5zZHEXLAzvRuujxUYg+O4W
	R0MJCi5GzHCe7OwmaD64M278nXfBVC7q17PBLYUfg6Sk1c/NqOT3GGjAmH+SFoZad4dfzF63GpB
	J5Jmf3ovZ7eTaoUKNWBEtX41kpvfTegk4EIlL1gxKaCbNrP2wvCRk/zTvLjUXV0L8k9QV2KDij2
	P07hFPJP7m1vwjRKK7EhY2w7er1so7JF5ZnNH4rB00tQVr9WlFHJ03LXRU+TOFkbv7JuXwGOMeo
	oONKwSdE+AX9bq
X-Google-Smtp-Source: AGHT+IGQ72Qv40VXzWytpO8QexsPaVNcVSgbu9++QRVSPgfELMtmnY3IL6BZct+pHXLP45EtI7mwDQ==
X-Received: by 2002:a17:903:3b86:b0:2a0:8966:7c9a with SMTP id d9443c01a7336-2a2f2c5e17cmr128978835ad.58.1766499261071;
        Tue, 23 Dec 2025 06:14:21 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a2f3d5dea1sm126783015ad.81.2025.12.23.06.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 06:14:20 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 23 Dec 2025 22:13:44 +0800
Subject: [PATCH 3/3] mfd: macsmc: Support variable app endpoint start
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-rtkit-v10-v1-3-12b4783d6403@gmail.com>
References: <20251223-rtkit-v10-v1-0-12b4783d6403@gmail.com>
In-Reply-To: <20251223-rtkit-v10-v1-0-12b4783d6403@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4098; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=M8K2zyn6hgbZbYWDWq9d9LHWwqY0uxaEJ1APjbEF8uc=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpSqO0FVpbSnWy2ywhYchunAaQhBkTgjRFRp5so
 ykp/7/dG8iJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaUqjtAAKCRABygi3psUI
 JIEoD/0f3NCHVZ2r8ele5bqiSXKPtHaBivP+HJp6qU5/SgN+2PTLkkR8FGBjk6qCd+1BklLR2lx
 YgHveWm7ER9OJn+oq/kdjl/Qc9J3csrgRdnpH5LJWHF8bEWoEfmZ/rP/NQrAd8N7FFJNkhhaRVN
 sUT63qgPNEPIV7O1w75BTVaS+xBXsDjE45D0pOmyMixLEX8bRpToAtMeWIiU51YrlxtDJ3zmbwl
 f9zPJK8OHe/cAH1JE9E+s//hWxzM9GV3tjg02NGv7bUylHHc7skszdfH5UUWAtxy5zX5vTswKFW
 CbKr7606xyLB42oJM7ccaJYsBBAAIlLZNhdufUlawnPofJyHy9qxRpvtSrKH64zkN5nwUBU8o3Y
 yWCxQyj2UBw5lq+7vlrUtKVCnI1n8r1vlzvc+qSzMctfnNVVU4NVWYj32FStCm+bC+g8P0WLOzp
 qg9Q/UpZe15HvQOQp84YHipBRVSl/6ganKd8LG7Fliqe4XV4D7IwOFbgO+Koxc/hj437iMGrhvc
 LTTmT+K3F/2j40vUrR/H8mIRtHkVa4blaYlmXsoc6QzZUvEGwJaz08V9OEnL+Nv+U9csORd6yOB
 SURtZQBqNHF3JCQWeaCCagEHpm0Khnn3kYGCcl0vRRECxoZFnnqK+NOPIOg2tvXpEsPQIdKQfaU
 asmCSLfjrPHh2Tg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Instead of hardcoding the SMC endpoint number, use
apple_rtkit_app_ep_to_ep() to convert a relative endpoint number to
an absolute endpoint number in order to support protocol versions
with a different start of app endpoint number.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/mfd/macsmc.c       | 18 +++++++++++-------
 include/linux/mfd/macsmc.h |  2 ++
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index e3893e255ce5e4bb4832d80ad1fc002d413a291a..4e0fc5ddf9293ee7281680e964fc5f9b80260b3d 100644
--- a/drivers/mfd/macsmc.c
+++ b/drivers/mfd/macsmc.c
@@ -21,7 +21,7 @@
 #include <linux/soc/apple/rtkit.h>
 #include <linux/unaligned.h>
 
-#define SMC_ENDPOINT			0x20
+#define SMC_APP_ENDPOINT		0
 
 /* We don't actually know the true size here but this seem reasonable */
 #define SMC_SHMEM_SIZE			0x1000
@@ -72,7 +72,7 @@ static int apple_smc_cmd_locked(struct apple_smc *smc, u64 cmd, u64 arg,
 	       FIELD_PREP(SMC_ID, smc->msg_id) |
 	       FIELD_PREP(SMC_DATA, arg));
 
-	ret = apple_rtkit_send_message(smc->rtk, SMC_ENDPOINT, msg, NULL, false);
+	ret = apple_rtkit_send_message(smc->rtk, smc->ep, msg, NULL, false);
 	if (ret) {
 		dev_err(smc->dev, "Failed to send command\n");
 		return ret;
@@ -262,7 +262,7 @@ int apple_smc_write_atomic(struct apple_smc *smc, smc_key key, const void *buf,
 	       FIELD_PREP(SMC_DATA, key));
 	smc->atomic_pending = true;
 
-	ret = apple_rtkit_send_message(smc->rtk, SMC_ENDPOINT, msg, NULL, true);
+	ret = apple_rtkit_send_message(smc->rtk, smc->ep, msg, NULL, true);
 	if (ret < 0) {
 		dev_err(smc->dev, "Failed to send command (%d)\n", ret);
 		return ret;
@@ -330,7 +330,7 @@ static bool apple_smc_rtkit_recv_early(void *cookie, u8 endpoint, u64 message)
 {
 	struct apple_smc *smc = cookie;
 
-	if (endpoint != SMC_ENDPOINT) {
+	if (endpoint != smc->ep) {
 		dev_warn(smc->dev, "Received message for unknown endpoint 0x%x\n", endpoint);
 		return false;
 	}
@@ -366,7 +366,7 @@ static void apple_smc_rtkit_recv(void *cookie, u8 endpoint, u64 message)
 {
 	struct apple_smc *smc = cookie;
 
-	if (endpoint != SMC_ENDPOINT) {
+	if (endpoint != smc->ep) {
 		dev_warn(smc->dev, "Received message for unknown endpoint 0x%x\n", endpoint);
 		return;
 	}
@@ -427,18 +427,22 @@ static int apple_smc_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to wake up SMC");
 
+	smc->ep = apple_rtkit_app_ep_to_ep(smc->rtk, SMC_APP_ENDPOINT);
+	if (!smc->ep)
+		return dev_err_probe(dev, ret, "Failed to get SMC endpoint");
+
 	ret = devm_add_action_or_reset(dev, apple_smc_rtkit_shutdown, smc);
 	if (ret)
 		return ret;
 
-	ret = apple_rtkit_start_ep(smc->rtk, SMC_ENDPOINT);
+	ret = apple_rtkit_start_ep(smc->rtk, smc->ep);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to start SMC endpoint");
 
 	init_completion(&smc->init_done);
 	init_completion(&smc->cmd_done);
 
-	ret = apple_rtkit_send_message(smc->rtk, SMC_ENDPOINT,
+	ret = apple_rtkit_send_message(smc->rtk, smc->ep,
 				       FIELD_PREP(SMC_MSG, SMC_MSG_INITIALIZE), NULL, false);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to send init message");
diff --git a/include/linux/mfd/macsmc.h b/include/linux/mfd/macsmc.h
index cc09ecce0df7424b288d4248d869f4c9bed3e188..1a462baae0e38ac099f90988afda0f3f5ad968b9 100644
--- a/include/linux/mfd/macsmc.h
+++ b/include/linux/mfd/macsmc.h
@@ -93,6 +93,7 @@ enum apple_smc_boot_stage {
  * @sram: Pointer to SRAM resource
  * @sram_base: SRAM base address
  * @shmem: RTKit shared memory structure for SRAM
+ * @ep: SMC endpoint number
  * @msg_id: Current message id for commands, will be incremented for each command
  * @atomic_mode: Flag set when atomic mode is entered
  * @atomic_pending: Flag indicating pending atomic command
@@ -118,6 +119,7 @@ struct apple_smc {
 	struct resource *sram;
 	void __iomem *sram_base;
 	struct apple_rtkit_shmem shmem;
+	u8 ep;
 
 	unsigned int msg_id;
 

-- 
2.52.0

