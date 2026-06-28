Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853803A5435
	for <asahi@lists.linux.dev>; Sun, 28 Jun 2026 11:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782647007; cv=none; b=H8mwF9+FpC4gs8tTWpN0J9djpC7StShgJtXcd+Mj8muoZ8yPUmAAebKMJi/Fzn1betW5BKyRXxL7GeQ/kzZWJdcBS91Gxl4LNvAte4s/leueTL+bSH0spTR1DXiTY1k7UjH+FDLin27YryfyBRRh84xDp5bqba9nGuu5zBeXkrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782647007; c=relaxed/simple;
	bh=f9Z8Po5dG+RGUXsODFlcTQisxKau0phFttvagFoIj8Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sKES0mP2gq1Nt3tTO3o/QHonKhHpuvyVHDMPzVBLWcf/EbnPjCdxokoeX/Jijoa2eVCYDqs5tgLnnPHrzKF4qxyRz0Gn0byZF9ytES5Jggk2E2si1rag48jrF5dnGrkPZ1kgj7+8XC6S8AzNO3tfNjxcvY4tZyDkDxYya/QKplU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SAc/QoWs; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SAc/QoWs"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-30ec3dfbcd1so350276eec.0
        for <asahi@lists.linux.dev>; Sun, 28 Jun 2026 04:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782647006; x=1783251806; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZVxBwO9ofhwXsj5qcE/m/Bgq+dyvGwnXosapaOuR78s=;
        b=SAc/QoWsNrip8VbK927Z0Pp2K8JbE4C1UUSnJ30RxMpyTFQElsfag8KJOsLWuJAOj/
         JYXDvzXpZWZ07U+G6vxCRNizG5jiDUU3vFvzqQWCelxTTZMCXGW2DZA493T8jyRtk+Dl
         fJBl25L9pv31mCuKYlw8i8yS2Zgx/z7JVds9rXiLTBgljp6t7lgzXhcixjxW2CoLu60o
         QAcFqMgLi18i1s2qETSA8Aq3XsUYo8kssN3kRUwYmzzEtBe00cf2K4f+Ks6TZe26Z8wB
         mQi2uzAfh6fnU2+SFNG0ZhPBYg5/EwzutnvgosqRiajy4qSUOs3Ftf5s90/6cZGTKNLp
         adnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782647006; x=1783251806;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZVxBwO9ofhwXsj5qcE/m/Bgq+dyvGwnXosapaOuR78s=;
        b=JHmhUi8CbiMT4z+22E5l562WZcIwBU2+9KT6L5xe0NvOT/JRXCp2tvsv12va0MHW0D
         110uAfZbwj2GpG97HCK0xjnifLAdQcurrj4hGocICwucFdZDnbgCTj4a5saa1x2ljexg
         sHfvoghOAykUZJJaFs/6FtIeN+QQJhHzoo1Sj7mky76NmmVeONII/h16NPeFOaarf5Ir
         U4EJtIv4VBEWK23wen1IpfGDmlUbxTBINkU5Q7xBq1+wXaOnhy6i+ujMrWGA18wYbhL5
         hQNS/K5QkM3oucJw15BWl2IPKrfIj22qnl7aF0Xa9rhwHH4QRbgLibtrnjxTPicw22JE
         H/QA==
X-Gm-Message-State: AOJu0Yxhvhj70xvT1uVVNiDQGRjhaotHjMl9kKneZ0OFL5OIMD2810Lr
	AXH9SvTFS7nXPpAELnmKCmK6LEYNOrwNNwJs5WykA5BE2bOwfpPUwexl
X-Gm-Gg: AfdE7cmknsPQs94U7hkcKvgj0NNdaXB63aeEtm/d6ncVhiuFS5UOEuuUC8+4uRDiQUN
	7e8rP+kMnrle4lTszqhMyHWgcvzoBu/Aj5lIe+jkeXGDsTZFv/oHv3lcmkxrOZ2yFfAV4gXK9gm
	1dFrugd1HrHf/RWOm94WF2WnNyqj5RXZiGlmOnIhrvVvojEAJuMx7M5b4ZqidNBBddEhwJtAgL7
	ByrYxDfvCk37OpG7BjXhkYM0u2j6MWFog/oKynBjpgwGNBOT0kkd4zS+tLIC8n1CD6MpjJ+u2VJ
	RQrDpFAzPiZflQeXqGimd88yR7B8JFbjpqMaKABAFd3IywfRcvW4t1vvblPgE7lGGk7cC0DS+Sj
	a+Ui2odwVfbDQTq2yHGoDqQkbqItAUD8Am0HBm1+gyviazhG9se1u+aKhI8ydOX71gUOtasIfy9
	6T4KueJImV12+gMQrza/yrgCl7pqB42nx6kyVOZXSADfkRE7dd/oUn66t9NNcslb+GXW7XhtQAJ
	yVxCvQXthpCr2Gy8lvEd6V9rMoBCnCiE6XGPMNnSugfqcN+82c9Z1Zi0L+MfynhWQ==
X-Received: by 2002:a05:7300:a485:b0:2d8:7302:d3d with SMTP id 5a478bee46e88-30c84d5034emr11553921eec.8.1782647005659;
        Sun, 28 Jun 2026 04:43:25 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c8b1a80sm34520756eec.18.2026.06.28.04.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 04:43:25 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 28 Jun 2026 21:42:05 +1000
Subject: [PATCH v2 7/7] ASoC: apple: mca: Add delay after configuring clock
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260628-apple-audio-redux-v2-7-6328269c9652@gmail.com>
References: <20260628-apple-audio-redux-v2-0-6328269c9652@gmail.com>
In-Reply-To: <20260628-apple-audio-redux-v2-0-6328269c9652@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hector Martin <marcan@marcan.st>, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1040;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=FKofmjv+HMrQuSW7ticy2BojcrI4dpO37WSVpG9Fvcc=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmOHHs2zPshPdexky1RRnnzjANxF16Eyh9O8Z+T1+/lX
 z1RxKGvYyILgxgXg6WYIsuGJiGP2UZsN/tFKvfCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjrGOkYMXJwCMNUGcxj+55rULluzUllXxTu2fv4Pp2OvfqtYZkl82lLp5584vfZWFyPDTqt+rbt
 2+9dfEFFRX/7va8+rhddYT0bFz63Y8nOHlm0mIwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Hector Martin <marcan@marcan.st>

Right after the early FE setup, ADMAC gets told to start the DMA. This
can end up in a weird "slip" state with the channels transposed. Waiting
a bit fixes this; presumably this allows the clock to stabilize.

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/apple/mca.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index a1da01b0be32..eaa4e81f9a3b 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -225,6 +225,12 @@ static void mca_fe_early_trigger(struct snd_pcm_substream *substream, int cmd,
 			   FIELD_PREP(SERDES_CONF_SYNC_SEL, 0));
 		mca_modify(cl, serdes_conf, SERDES_CONF_SYNC_SEL,
 			   FIELD_PREP(SERDES_CONF_SYNC_SEL, cl->no + 1));
+		/*
+		 * ADMAC gets started right after this. This delay seems
+		 * to be needed for that to be reliable, e.g. ensure the
+		 * clock is stable?
+		 */
+		udelay(100);
 		break;
 	default:
 		break;

-- 
2.54.0

