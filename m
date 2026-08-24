Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D8D3AAF62
	for <asahi@lists.linux.dev>; Mon, 24 Aug 2026 08:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787560017; cv=none; b=jqlfgwoUI6quZfmQoj1foSr7AtlAyoCgrE+dth6n+3PhUdFcKPNecF3AR7BMQBIpKT1SEV9jizZBq6rRNaJO+Wapte0rLSJowEif3lkfXMKPo7sjuvTLEZJmC/h+SfA/cgCJbmdl/zQsPLSUrIK9CwXlkZ6fZfSp9Qb0Ld6DJXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787560017; c=relaxed/simple;
	bh=lYyIoNF3fWmkhnHE9fSVPTTMtQXhuZGIpVAThKlsbYc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=haV0451R+4cQZCbM4WfnKsz+dVQjMnwhLWy6XdraNeMOEBrPmtA0LYeWrAF5K+eRcQqP/vVPhl7KdP2mGVyc06bLpObf36brPCr5N8OysTm623UMGDYIWXusVt408jQ/x+gVie7JExN3pVRRtrNfM18Xd95D3xh7ZXFb4fPI7x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pvPremXG; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pvPremXG"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso3409015a91.3
        for <asahi@lists.linux.dev>; Mon, 24 Aug 2026 01:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787560014; x=1788164814; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rvwvU2fx//eAu2LlByDRKWPs/wkyAhNxSDJe0aj8Fuk=;
        b=pvPremXGNgsD7NVRQQ/wuwNFyyTgB5yBRyJW0YT7y/5PrUom4Wk8x1IOFRqggi2tmk
         yYpEBuxBf37rm4Ph6bKXZJjNH0fG1fTDnlqkd09auTjGLFAtIOzD5OyhO9jkrL+VfiVV
         Ic+p9Iwex0JINYA/+hs26G7THe0AfdNRahL/Nuoj4+6k0ZqoMvZk2AxWEDqjQqOw7p5y
         ky7/WBDd0wFbUPHC2ZR/DTaWPtWi7k/vnMIPw4HrjyASRFxdPOs816frxSGj3Y9jPyM2
         fAnqryO/0pRjrxJikDWu0x6c+roBmrK1oCz09U8654DG1SuEziNYfkZVuuS+btdMgyx4
         YNiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787560014; x=1788164814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rvwvU2fx//eAu2LlByDRKWPs/wkyAhNxSDJe0aj8Fuk=;
        b=c9zLUEnpdpUYL8TmakcXIC2FPfGtSxbJTgsovf++R9gOhEFE2sJpUjdPpsMSaGt+X/
         kfZza4Q8r1Ek6lj8jba88h/pdoqfLh9R0OvXY2WsD9DxNhru14cLlnPjtFJZsHRORj22
         //fALIXE1rBh2l26oP0w2uqRYHwnmtpjQY9FYSMQDRhuU4HAzg6JMaMRw9TgtaIPISKI
         jeBvqqznxyWwhQrnPAxiSRSIJoc0UG+wPhf11R2HIv9rNKtHx5Sc7GpK5Xh1QMzFfz1J
         ozUwI3/w0gFVtj4aaQRmJL5zMajp5q8EKIs2Va56VHtovW7dO77s8zjgWx4MsVutp20S
         LZMQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr4MiH+OGORsNgxNWUSyn9Oh4hwFr38UElbhukmzwOZGr7Tzfgqy5eHfdo2kwQMSIOARNtYcQ==@lists.linux.dev
X-Gm-Message-State: AFuF++nhIlHfw5ndnGziHyMZYtdbCD4tNYWXeaq4RX/aEh42/c+53T15
	+dSl8hQROxr9sYZkvvXUhFRYzzI8NySk/607rnNqoAtRAoGUOWrCfYrE
X-Gm-Gg: AR+sD12Alspaq/bCneKMGN7a6cNQ7lLF7bz3g58MHn9Dpa/245M/IPRZTl144Lgwtd7
	2+UeOh0gOWOiVitGuv3YuNWQaF9QRWEDmCC/gfyJxEz02AhtA1ImEr2DuOrbprOkj2ZyRqu2fWM
	aKOXM6ZQ8g87EtWWsj2bkt4lS/gni/1oXuG44DKUako21u/fvcAkV6bILkuGfubXQh0vcSTL/RI
	JDoMicNEkRknF+2tNCB6fz8iAFkXgXQZzvM2Kq1CWOtp5EJesqCSSNLa/HgbfQIuqCAh9GAFzy9
	Oco3ejoY+TV3/i85ftBI95Bdfv8jQxFM0whp/F/e6G1LueArOX01z5d2GRWUSse2SiFur5C0QRp
	LXemj8mKURhBgV1KG7xtB3rhA3omNn/oUQVgV4z5zIWdfs2ne2Jcl/hVEb7PcyLb4C9W9ZBOtwC
	d7FjbHMJnfQK0sYcgqt9PuS3f5tACiO3uuD8CvGOf6534Kv0DdMIXxcPaLQJ++ch4P4ndawDHBs
	tJfdFkp1qLMCvO6VuLyyH2UhNoxEebqMki85VIG35BN9UbP909oc/GcB0NNanA7KfnW/r6WtkMn
	RTJ90/T/qV5amHfPRDox7b0Ooh2kvFTaKUkQef9uoD66+vjSijA5AxpZDMsCLTUIXA087TuNZku
	aJwh0E0lKgrx2SYeGa5PyPN8IQA983MLEe8GRu7wDCMUhJPs=
X-Received: by 2002:a17:90b:5347:b0:395:a7eb:a4d8 with SMTP id 98e67ed59e1d1-395c3a4bd22mr48059051a91.14.1787560013592;
        Mon, 24 Aug 2026 01:26:53 -0700 (PDT)
Received: from localhost.localdomain ([101.251.7.10])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f90c0dd3sm25994595eec.7.2026.08.24.01.26.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 24 Aug 2026 01:26:53 -0700 (PDT)
From: Laxman Acharya Padhya <acharyalaxman8848@gmail.com>
To: Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>
Cc: Neal Gompa <neal@gompa.dev>,
	Arnd Bergmann <arnd@arndb.de>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 1/4] soc: apple: rtkit: free syslog buffer before reinitializing
Date: Mon, 24 Aug 2026 14:11:37 +0545
Message-ID: <c14026054a393b581d3dd91a618892616424e202.1787559303.git.acharyalaxman8848@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <cover.1787559303.git.acharyalaxman8848@gmail.com>
References: <cover.1787559303.git.acharyalaxman8848@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A second SYSLOG_INIT message overwrites syslog_msg_buffer without
freeing the previous allocation. Free the old buffer before allocating
its replacement.

Fixes: 9bd1d9a0d8bb ("soc: apple: Add RTKit IPC library")
Cc: stable@vger.kernel.org
Signed-off-by: Laxman Acharya Padhya <acharyalaxman8848@gmail.com>
---
 drivers/soc/apple/rtkit.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soc/apple/rtkit.c b/drivers/soc/apple/rtkit.c
index a3fdac8f6f06..1886f7eba77d 100644
--- a/drivers/soc/apple/rtkit.c
+++ b/drivers/soc/apple/rtkit.c
@@ -422,6 +422,9 @@ static void apple_rtkit_ioreport_rx(struct apple_rtkit *rtk, u64 msg)
 
 static void apple_rtkit_syslog_rx_init(struct apple_rtkit *rtk, u64 msg)
 {
+	kfree(rtk->syslog_msg_buffer);
+	rtk->syslog_msg_buffer = NULL;
+
 	rtk->syslog_n_entries = FIELD_GET(APPLE_RTKIT_SYSLOG_N_ENTRIES, msg);
 	rtk->syslog_msg_size = FIELD_GET(APPLE_RTKIT_SYSLOG_MSG_SIZE, msg);
 
-- 
2.51.2

