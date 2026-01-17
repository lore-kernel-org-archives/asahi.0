Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F157622D7B6;
	Sat, 17 Jan 2026 17:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768672761; cv=none; b=BQHNdzbysV24jH8JB/QwqubpIaikMPKtW1MJhUeFt5G44v4CeEROpjubJHGSiXPFlzomxkRqS5PUZr+ELoPIa+0Uk2TRiE42WrvHTM/gzraukTCW251j6Hy9feYLyAaGWd/pwFlbBvw0fauGdroM9T2rR9kw33qH/0q7poGTe0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768672761; c=relaxed/simple;
	bh=zDvjb3watAeZWV4UQaO3jImyGn5TEPR5wDXBBz0n3DU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=S9gpWuP6Yh7j6QX1h7VVVH3cw1DCcWbpbDSwoUYwy2mfB6CAdSdPnC8BLNwxZ/EZQBhf1rv7XbSSk/Ro1xUba5VXCkh7Hu8HXZMFuYG6WKU18jiNa26KZ+xYc2KTgcXAX1DRhVCK1UuAmroejTpJ0OaxPrmhYQnliwnn/UPJt4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ISZgiuDT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ISZgiuDT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34DAEC4CEF7;
	Sat, 17 Jan 2026 17:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768672760;
	bh=zDvjb3watAeZWV4UQaO3jImyGn5TEPR5wDXBBz0n3DU=;
	h=From:Date:Subject:To:Cc:From;
	b=ISZgiuDTNdBHn/MOYucEePOV7cdSIvSsQQzDlrcX+tO1WKLxp91ivJFR0QlHc4D98
	 J9fgPgiHSAUoajajVj0YE73EBT2GZvAVGSVA+7+uArD4YCLD21xP7SG6UMoXt1PydG
	 LzQaOIq6lJSITqaivVfDaV4iJqKhBzgK/RrOQ/Xe1/1yb+Php9gTqEf1/xYmNb9lKR
	 S1lT9VJ9iyd/AUS66qiumweOsC5EL5EaQc7py9mo3PKRE9/a2eiQkYCoO5qulNp4eb
	 iTiS7bj97QMCXQgLGLnFWdYO8uFRhTjTdr8j3hSZUv4kJM/YC+icVGmRhyWMYpdQJc
	 231nAunV36SKg==
From: Sven Peter <sven@kernel.org>
Date: Sat, 17 Jan 2026 18:59:10 +0100
Subject: [PATCH v2] soc: apple: rtkit: Add function to poweroff
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260117-apple-rtkit-poweroff-v2-1-b882a180e44d@kernel.org>
X-B4-Tracking: v=1; b=H4sIAO3Na2kC/4WNTQ6CMBBGr0Jm7RimAv6svIdhQXEKEwhtpgQ1h
 LtbuYDL95LvfStEVuEIt2wF5UWi+CmBOWTQ9s3UMcozMZjcVDnRGZsQRkadB5kx+Berdw5te7K
 WXNFQXkKaBmUn7z37qBP3Emevn/1loZ/9E1wICStn+UJFydeqvA+sE49Hrx3U27Z9Aarw1Hu5A
 AAA
X-Change-ID: 20260117-apple-rtkit-poweroff-bc3bb1f4a105
To: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Sven Peter <sven@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2357; i=sven@kernel.org;
 h=from:subject:message-id; bh=zDvjb3watAeZWV4UQaO3jImyGn5TEPR5wDXBBz0n3DU=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ2b22U8ChfkLm5wbwjffUZbxaan24evdyNn2OfZzReLKf
 duuOEp2lLIwiHExyIopsmzfb2/65OEbwaWbLr2HmcPKBDKEgYtTACZi0MfI8FNTz/et8r4bLBes
 M1bluxVPPGCela/waKny6W+LFN0fP2T4X/xKqa/KrqImKdSSo+2Bt8OjXYte/J5T7mm8hS3D+4I
 FKwA=
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93

Add a function to put a co-processor into the lowest possible power
state from which recovery usually isn't possible without a full SoC
reset. This is required for the USB4/Thunderbolt co-processors which
can be restarted since the entire USB4 root complex can be completely
reset independently of the rest of the SoC.

Reviewed-by: Janne Grunau <j@jannau.net>
Signed-off-by: Sven Peter <sven@kernel.org>
---
Changes in v2:
- Collected Janne's r-b tag, thanks!
- Fixed line wrapping (Janne)
- Link to v1: https://patch.msgid.link/20260117-apple-rtkit-poweroff-v1-1-6fbe8145e965@kernel.org
---
 drivers/soc/apple/rtkit.c       | 16 ++++++++++++++++
 include/linux/soc/apple/rtkit.h |  7 +++++++
 2 files changed, 23 insertions(+)

diff --git a/drivers/soc/apple/rtkit.c b/drivers/soc/apple/rtkit.c
index b8d4da147d23f7e99e76eea314e4d976cddbd1c6..4ad4f964fde7f821a40b8cde452fb201ec337ffc 100644
--- a/drivers/soc/apple/rtkit.c
+++ b/drivers/soc/apple/rtkit.c
@@ -851,6 +851,22 @@ int apple_rtkit_shutdown(struct apple_rtkit *rtk)
 }
 EXPORT_SYMBOL_GPL(apple_rtkit_shutdown);
 
+int apple_rtkit_poweroff(struct apple_rtkit *rtk)
+{
+	int ret;
+
+	ret = apple_rtkit_set_ap_power_state(rtk, APPLE_RTKIT_PWR_STATE_OFF);
+	if (ret)
+		return ret;
+
+	ret = apple_rtkit_set_iop_power_state(rtk, APPLE_RTKIT_PWR_STATE_OFF);
+	if (ret)
+		return ret;
+
+	return apple_rtkit_reinit(rtk);
+}
+EXPORT_SYMBOL_GPL(apple_rtkit_poweroff);
+
 int apple_rtkit_idle(struct apple_rtkit *rtk)
 {
 	int ret;
diff --git a/include/linux/soc/apple/rtkit.h b/include/linux/soc/apple/rtkit.h
index 736f530180179bd144cf85eb0f0bd93844d7188a..bda3c528b51553c13f7fe5685ab60f7fc675361b 100644
--- a/include/linux/soc/apple/rtkit.h
+++ b/include/linux/soc/apple/rtkit.h
@@ -125,6 +125,13 @@ int apple_rtkit_wake(struct apple_rtkit *rtk);
  */
 int apple_rtkit_shutdown(struct apple_rtkit *rtk);
 
+/*
+ * Put the co-processor into the lowest power state. Note that it usually
+ * is not possible to recover from this state without a full SoC reset.
+ */
+
+int apple_rtkit_poweroff(struct apple_rtkit *rtk);
+
 /*
  * Put the co-processor into idle mode
  */

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20260117-apple-rtkit-poweroff-bc3bb1f4a105

Best regards,
-- 
Sven Peter <sven@kernel.org>

