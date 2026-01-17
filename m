Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235C2274B51;
	Sat, 17 Jan 2026 17:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768670731; cv=none; b=nZeUAgigaT8R5t9x9D1OSCGAtTHpdy8zt8tVZn5AT7DoidMaoCEegS7ZeFc7RsjbJGO5JQe1mdIAGdDQ2FmKwuDCBnoRVIHKLm2V9Z/M6WlhNLhPnsI8ZX2R1ILim1WQCzIQrnjDYVmeuZNsQEaBE4nJsVPMyyUwXX+p9DBwifo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768670731; c=relaxed/simple;
	bh=4V35tKqw5KQHMXyZcaINOZDMyewJrJBwf6xXsdEQV0I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=SglfMH1YYeWYex/O5/+wqHU53pUc/QR4/UnCRwm4cEe8d3HdsL/hNnU4S+3wwS/AYrnHZMz9ZZ0gcpM5VGhqcoF2u4y5gOuw42rs+sQGmuLjurgM1yLs2Gvyz1XVz6QKD6FB4Ks5kM2T+T3FbnNA/SjDZfU9VOdvI6+laWLu+eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rYz3D+er; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rYz3D+er"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A7E1C4CEF7;
	Sat, 17 Jan 2026 17:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768670730;
	bh=4V35tKqw5KQHMXyZcaINOZDMyewJrJBwf6xXsdEQV0I=;
	h=From:Date:Subject:To:Cc:From;
	b=rYz3D+erMRpxk2pzST5vBLjNjFsQ9n9O/kXyFNR0KhOOY+mSG6am/Bu7MJcEPJZYZ
	 VfUT2bB6u975c0AWASxTa7LwldPKj/2xE3cLyMzDUlVSPH52wRsCopTM/8o4E+Cd7p
	 O9cD5ppR5uLf/pchTFgnXJBGgv60qOl9UWgFK5B/XqNVucfDociJWjH8tHVagitYF9
	 U8iW8F22l717GV3JBi7IZGYblnr1GLjrQtH153+BqlRbhpWG9Hi0yqtOTfePfhJe7s
	 ySqK7jh9wA5P7BYerhLGNYl1Y0dt+VP6VFEp0DqU5EWNUct+elIiOW2sPMF72aHIbS
	 LVCBmfVsdKFSA==
From: Sven Peter <sven@kernel.org>
Date: Sat, 17 Jan 2026 18:24:44 +0100
Subject: [PATCH] soc: apple: rtkit: Add function to poweroff
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260117-apple-rtkit-poweroff-v1-1-6fbe8145e965@kernel.org>
X-B4-Tracking: v=1; b=H4sIANvFa2kC/x3MTQqEMAxA4atI1gYaf2GuMrhoNZ0Jii2pqCDe3
 eLyW7x3QWIVTvApLlDeJUlYM6gsYPzb9ccoUzZUpuoMUY82xoVRt1k2jOFgDd6jG2vnyDeWTAs
 5jcpeznf7He77ASauEJlmAAAA
X-Change-ID: 20260117-apple-rtkit-poweroff-bc3bb1f4a105
To: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Sven Peter <sven@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2139; i=sven@kernel.org;
 h=from:subject:message-id; bh=4V35tKqw5KQHMXyZcaINOZDMyewJrJBwf6xXsdEQV0I=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ2b20QfzzgRv9XyvfZBHuLLr8W49fSX1nNralIkzZdapP
 /x95nxvRykLgxgXg6yYIsv2/famTx6+EVy66dJ7mDmsTCBDGLg4BWAi0f8Z/sr1/tt3XveogtnL
 WZ/K352YGJHudSp2l/hPzgDDbq/iD+wM/13cZAsua2o5bDA8YvBA6bm8GZPeBM/2UJdPwbmxiSl
 LuAA=
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93

Add a function to put a co-processor into the lowest possible power
state from which recovery usually isn't possible without a full SoC
reset. This is required for the USB4/Thunderbolt co-processors which
can be restarted since the entire USB4 root complex can be completely
reset independently of the rest of the SoC.

Signed-off-by: Sven Peter <sven@kernel.org>
---
 drivers/soc/apple/rtkit.c       | 17 +++++++++++++++++
 include/linux/soc/apple/rtkit.h |  7 +++++++
 2 files changed, 24 insertions(+)

diff --git a/drivers/soc/apple/rtkit.c b/drivers/soc/apple/rtkit.c
index b8d4da147d23f7e99e76eea314e4d976cddbd1c6..381faaf74d5982163d2c44d1e2c6e0ddad07bd73 100644
--- a/drivers/soc/apple/rtkit.c
+++ b/drivers/soc/apple/rtkit.c
@@ -851,6 +851,23 @@ int apple_rtkit_shutdown(struct apple_rtkit *rtk)
 }
 EXPORT_SYMBOL_GPL(apple_rtkit_shutdown);
 
+int apple_rtkit_poweroff(struct apple_rtkit *rtk)
+{
+	int ret;
+
+	ret = apple_rtkit_set_ap_power_state(rtk,
+					     APPLE_RTKIT_PWR_STATE_OFF);
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

