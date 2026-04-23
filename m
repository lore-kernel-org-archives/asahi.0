Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11C83EDAC5
	for <asahi@lists.linux.dev>; Thu, 23 Apr 2026 12:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776948730; cv=none; b=e2y9FsRHxRtX4NJ2xJB+iymbUawGKCli7QW7oezw+QdDUGBHECJwQcX6rvlDwz82MluJ6d2QyygtQskU0XTPT6sM0cfAyLxFB3NaTPE/SP19MprQNboeVWAYxIvhYZpHoO6d71cVLnrvMsxf3FTyN2a3oS946HXZu5yGUhq1mOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776948730; c=relaxed/simple;
	bh=Jg5SR7o1VcWMJNB5wdQqpvyhrEnCSnyB6mn3nEk4jeM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JjnXp/7yybNH3MpeIaGItlN4ZBlGL2/HrcSXmkyUiIYMxqWuAJYNVxVfPJ6RjPKteIfMd5DaUhep3EE3YuaehjIJ3Bk1GptSTN2dfZug9X9fRSMHH1bjaCp0YbQkRQVVPR8/ZNzMPXHxXqHwq3RggRA0KxAMYpPmQd9NU7U1hA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i2unwkd9; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i2unwkd9"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2b7adb38d65so5554545ad.2
        for <asahi@lists.linux.dev>; Thu, 23 Apr 2026 05:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776948729; x=1777553529; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kvrsh829buHJ1xDv00U40C6X+HtmBnUZPS87U4o6y9M=;
        b=i2unwkd9iqq+a68qlVw5zQYX/FboJuNJKfDlQFwyDynHQ84VUENFijnkCqAOfg0EuR
         PVC0n2Ta6GSLNzo+73ETHzcNdM527Yk0+lj5+U1WEZ2Io9iu6On0aw1mX48u2hTiddkm
         7StXZTkQ96SDE0jIPK+YbDjOs16JN12I0CrjGAIaB/BXnPkW1DsLKO0ufc4ShnsapSm4
         5uGb1M1xeW+e9O4E/kwItVoNP+01dLocqyRJcETZSgEgze7Q/QVh/vSJbTXyspvr1HbL
         ArvZKnWoo/ckBUY8Gl6mn+TVu15ceHtNw0FECtLMqZmZ9qXFgdQT0Hy6de/w81K6gV88
         WwEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776948729; x=1777553529;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kvrsh829buHJ1xDv00U40C6X+HtmBnUZPS87U4o6y9M=;
        b=b67FKkNVhk13prWsJG5HjPqyvAtX5zd+qKlShTkU2HPYIyB/RACUhwnyam+Bp+fKia
         6oUeKFyLnqkDcZ6sRd0z1tLuhz3OSP2W1ikLQ7u4SUhgG1H7QMrgF8SyucXZ0yY9aP/i
         c51wJpLl+FrFyOnqxQHCrA33iqpTXJ7qpMsWP0VHRmVElyu/83cdxDSTjTr5NMXGEptW
         xlWKmzskTdJl9p9ICSzUbprNFUQFiz2WSTdNeEEaEqq6h8MuVnTBHEhjpw7QJ1PlngXe
         zNd3aHpd5QpNdIIfP1nQpSIGC6hWGmVYolWpt7W2mx5CVnCDY+b1F4Am22FK9vg8Cprf
         J88A==
X-Forwarded-Encrypted: i=1; AFNElJ/9fkLaqMy/yiTtOsl1JLbHLOAAuQz50eyHPBu0LzsV8dyYbm5tNz5HQFZnbTpc8W2ZZ356dg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5rOXf0Cl1QtBFnCHcbEpaXokYfFaeylQY0e1QSduAK2G+zLFG
	SExkuvPOr00XyxnRTfmXpatj/jNm4mGSL/6aRop72s10LFdqg2FXoNFs
X-Gm-Gg: AeBDies7b21lETK7LSR0OXxZ327gqJoKWqgkEINaUrW7V7y4RK4c5oo7neRWlNEgo+l
	RJF6Lz4RgvuG6jz9i40mHtdXX3HoUMV4LBJlh8fW0vCeMyuLkdw1YDJ4d82h4inIBEYd9b5j/L4
	wOxmzK7QcZI/xMsaijeqG1mS5nZ/4K+k4I6z+aNX/daVRWXS/TwUMZtZSeI49JbXC8roxqnhPRe
	IB1L76MlanikoXOs2xnaDr3wR5uV3XREdxIWNHH10kxe59BHzTcY67tegQuG4WHL5KGmeJrPwgM
	W9Mhtnsu9vx25nMvvQqilwqQvvVyevVc73a4XTOFmkYj8OWLm5jg4LMOBf5venibqlTBUC+e+iO
	zEX/gNNMRziwPiMIw8EBOl9GZgJJ1ddjWFlTx3M1UxXp4p/69pQyG0ZcbouinOdgedEma/m7Csm
	vDXxqmu6Tpf/k42FRri0cve++Yy7VWpWxSd2jdr+sS6gd2qTcWYyuJCbsfpMPqbhz2MLiY
X-Received: by 2002:a17:903:2986:b0:2b2:4c58:5ba7 with SMTP id d9443c01a7336-2b5f9f43679mr290188045ad.30.1776948728813;
        Thu, 23 Apr 2026 05:52:08 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab3c067sm193432875ad.76.2026.04.23.05.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:52:08 -0700 (PDT)
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
Subject: [PATCH] ASoC: apple: mca: Use guard() for mutex locks
Date: Thu, 23 Apr 2026 19:51:54 +0700
Message-ID: <20260423125154.156257-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/apple/mca.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index 39269cc7def6..492165c0e1ea 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -307,7 +307,7 @@ static bool mca_fe_clocks_in_use(struct mca_cluster *cl)
 	struct mca_cluster *be_cl;
 	int stream, i;
 
-	mutex_lock(&mca->port_mutex);
+	guard(mutex)(&mca->port_mutex);
 	for (i = 0; i < mca->nclusters; i++) {
 		be_cl = &mca->clusters[i];
 
@@ -316,12 +316,10 @@ static bool mca_fe_clocks_in_use(struct mca_cluster *cl)
 
 		for_each_pcm_streams(stream) {
 			if (be_cl->clocks_in_use[stream]) {
-				mutex_unlock(&mca->port_mutex);
 				return true;
 			}
 		}
 	}
-	mutex_unlock(&mca->port_mutex);
 	return false;
 }
 
@@ -765,9 +763,8 @@ static int mca_be_startup(struct snd_pcm_substream *substream,
 		       cl->base + REG_PORT_CLOCK_SEL);
 	writel_relaxed(PORT_DATA_SEL_TXA(fe_cl->no),
 		       cl->base + REG_PORT_DATA_SEL);
-	mutex_lock(&mca->port_mutex);
-	cl->port_driver = fe_cl->no;
-	mutex_unlock(&mca->port_mutex);
+	scoped_guard(mutex, &mca->port_mutex)
+		cl->port_driver = fe_cl->no;
 	cl->port_started[substream->stream] = true;
 
 	return 0;
@@ -788,9 +785,8 @@ static void mca_be_shutdown(struct snd_pcm_substream *substream,
 		 */
 		writel_relaxed(0, cl->base + REG_PORT_ENABLES);
 		writel_relaxed(0, cl->base + REG_PORT_DATA_SEL);
-		mutex_lock(&mca->port_mutex);
-		cl->port_driver = -1;
-		mutex_unlock(&mca->port_mutex);
+		scoped_guard(mutex, &mca->port_mutex)
+			cl->port_driver = -1;
 	}
 }
 
-- 
2.43.0

