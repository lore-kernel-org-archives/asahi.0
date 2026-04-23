Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29733B1B4
	for <asahi@lists.linux.dev>; Thu, 23 Apr 2026 12:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776949023; cv=none; b=c0kHA+SEq/SQg80SxOl6Qbt+DGHnzIVYo5etJKXkerShvRAM5nG0hX7jG9irUitxhymTbO3rAvj+Es3qRpfeZzzwy0BmHKkPFTcIFGEf8xSfv7Ju13mEzEQQOmgYTtShrJXomUBswvXt/5xLbyRPVCfWLECck9YXN3NKGZ1NgqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776949023; c=relaxed/simple;
	bh=EAh/kgpS2dXQLkjrw6aFA7ZAJ+HC4p1Mb4Hses+rQl0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tEImo7TCvIDAk+HORjnvNzpvprKBEOT62fzygE1q577bqgscmTJd457E6ivXRtRV1vYuEuwRYx0nllFhA+Ev3ApAo8A+ZmTrWChMRM8ASLh7dggPLHlXuYKHU27Do8Ej614n97t7/0lGeATi6l6RKA9MEHxbKE7hhMOBT6kFxzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AQA4uoYT; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AQA4uoYT"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2aaf43014d0so40937325ad.2
        for <asahi@lists.linux.dev>; Thu, 23 Apr 2026 05:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776949022; x=1777553822; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AXsTpd+KaPddike9Luv0ILdaVqD6907iy2CiTUyzt78=;
        b=AQA4uoYTUoq4h913yDD0NEDOW2Se6EJTfviwmmF+X2wrK/lD6NSgb4iQX7GVusHWUY
         M20FQYugjBHDF+9ubdlliJ1mtycqlXAS/q+h2V52IFCqD6IA1WKVJ1TcUAXz47ruTvPo
         aWfgQxTL3LKLy9E+R27te1MRZm90FdErA95Dw1aNqUr5EC24+PrwmCtbkfGHqhi4CLLP
         U7rgjb+bJoiwXt2uqq1gHs40yDZkUHk2mCO1k+cMw+BesDJn+7ZBCbseU+MUNEFqU4on
         4oaq9NG+YqJ812cepYnraoBojoziG0N8fXAvj6jb/lpTqcgi9F4tuMY8GbV6PJt2k0OJ
         xt6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776949022; x=1777553822;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AXsTpd+KaPddike9Luv0ILdaVqD6907iy2CiTUyzt78=;
        b=EPpyDp28Lnxx1TU6v8SxiKr8DFp2/tLm9NKsvxwOCJjLLyi/ITeSjouV576QYRHcfI
         mmKY82ZdkKWbKxPzq3FG/ePWwqetln91Z1MvNmeGL7+b2AOH2j3kEyq1AlQu11B+NzMu
         ICrg8/QEWKYem86urCVWvORc/hmrSnLyxuRrpdSoXVhZXqkDjrBBUeE4jVrF/0yM4AkU
         RCG/uhNBGgw9FbHMLpxojAXzLbkQEikgC2E0c+oVDaKXXFFpxtJrTHcY01izlrV2CKOP
         JcCl+LzAE10DXAYjy9PawhTh+tg7ayTsvMs21aFKbZRR9c++NvDjBY/rUVpCKpMcs+ec
         YFOQ==
X-Forwarded-Encrypted: i=1; AFNElJ90a8YlscRYWDojMIrhjkuosAEEtZmcp+0DgqxKeX6zjPtCHMJQHaNPLDUxB03R+kSGQDPWsQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzqH76ILyB9lRQyALMkftWIcRcgDmT3VU0QwMQjDbg7VZTb81cw
	mT9XI8oyV87XCbtVfxcJHDxou9F8nDMxa2n/9b1v3t8PQcTTYsnRmLr7
X-Gm-Gg: AeBDiet3yV4LhkIKX6qMHOgnJeB97e82IycMgDDaMhF3zS/Dvvbk+b509SR3CdxXkYT
	BSst0nPl+UPHcJarCOL048nCW5VKFpg0l0Srrwsvpwu3/tKpuH4xPvswiFkIttkEqyNWWwTleoU
	P+LgxubIDrPRdabRMr7UN4junSWRxNuDh7EeT5x4crrp/L9SLD4MSfpCAJvaBKvftQJOhLvtyac
	zrOJoiUrWwdQRDyloC8vW+/XBXqkR1BrOVwQ9QH1ErsddSvyql3IkElShbwvRTqSTiryTV+Y99G
	/DVl8pJzF9L1boZ/3Wwbo0g3KQfi8xGgddstV5mQguDbwdPh97nUt/hp5t4f3esjQxkIxCPHC0t
	JVczXkmQArlf+9tfSxlNF8YJ/J8yqvEVATSBgiohjs6Ni61q2pqGeREjRukVZ3ni7tta9b96h3i
	Crh7gr9uZn/ii8NqjjvxusMH5r1X0bWu8uIOs1YMoqocGzklC5HGvl4yLg4i7oaaswnHkX
X-Received: by 2002:a17:903:3d49:b0:2b0:c59f:3b58 with SMTP id d9443c01a7336-2b5f9e9a067mr213394595ad.9.1776949022207;
        Thu, 23 Apr 2026 05:57:02 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff390sm192106545ad.9.2026.04.23.05.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:57:01 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	asahi@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/5] ASoC: samsung: Use guard() for spin locks
Date: Thu, 23 Apr 2026 19:56:41 +0700
Message-ID: <20260423125646.156599-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series simplifies spinlock management across several Samsung ASoC
drivers by adopting the guard() macro.
All patches are strictly code refactoring with no functional changes
intended.

Best regards,
Phuc

bui duc phuc (5):
  ASoC: samsung: i2s: Use guard() for spin locks
  ASoC: samsung: idma: Use guard() for spin locks
  ASoC: samsung: odroid: Use guard() for spin locks
  ASoC: samsung: pcm: Use guard() for spin locks
  ASoC: samsung: spdif: Use guard() for spin locks

 sound/soc/samsung/i2s.c    | 118 ++++++++++++++++---------------------
 sound/soc/samsung/idma.c   |  26 +++-----
 sound/soc/samsung/odroid.c |  21 ++-----
 sound/soc/samsung/pcm.c    |  99 +++++++++++++------------------
 sound/soc/samsung/spdif.c  |  25 +++-----
 5 files changed, 113 insertions(+), 176 deletions(-)

-- 
2.43.0

