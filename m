Received: from cmccmta1.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8558018654
	for <asahi@lists.linux.dev>; Wed, 13 Nov 2024 01:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.22.67.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731463086; cv=none; b=XNoIeGP0XiaPbY0wWThNyEzUB8o2xmPTwtCuKz4dX28VcbmTBWQLOCX0o6Is+W+bkVokiFBuww1VdWnqujkfqQGYLy6P90Fawg5xdUuA0qoExf8EMtYQ9047dABLe/28R1JLc+cQTtbdW0VUTyAvBARRkhO1qbHTvQ04wChuFr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731463086; c=relaxed/simple;
	bh=Sb/hii9sYzUkbrxUho4NcJczD6dyngF5OH681nF1keg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Eyv2gl0eoag4RoZ9V9shHAXcvAjqrJWtieVpVdcfXvBIKkihhrn837cvQ8i/0Jdt7FN/u8F5LKg2lb6W038iwtVhKlBJxqPguCcB1g3DfOXCeHjrlnNq8qwYArMQgcRZWoI63+IVBwMzZC+cr2RcMc8XPkdmJ6JTeCgMY9Onivk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass smtp.mailfrom=cmss.chinamobile.com; arc=none smtp.client-ip=111.22.67.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app02-12002 (RichMail) with SMTP id 2ee2673407a8852-4986c;
	Wed, 13 Nov 2024 09:58:00 +0800 (CST)
X-RM-TRANSID:2ee2673407a8852-4986c
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from localhost.localdomain (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee1673407a7260-71818;
	Wed, 13 Nov 2024 09:58:00 +0800 (CST)
X-RM-TRANSID:2ee1673407a7260-71818
From: liujing <liujing@cmss.chinamobile.com>
To: povik+lin@cutebit.org
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	asahi@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	liujing <liujing@cmss.chinamobile.com>
Subject: [PATCH] ASoC: apple: Fix the wrong format specifier
Date: Wed, 13 Nov 2024 09:57:58 +0800
Message-Id: <20241113015758.5441-1-liujing@cmss.chinamobile.com>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the mca_fe_hw_params(), the variable tdm_slot_width is of
type unsigned int, so the output should be %u

Signed-off-by: liujing <liujing@cmss.chinamobile.com>

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index c9e7d40c47cc..b4f4696809dd 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -616,7 +616,7 @@ static int mca_fe_hw_params(struct snd_pcm_substream *substream,
 			tdm_slot_width = 32;
 
 		if (tdm_slot_width < params_width(params)) {
-			dev_err(dev, "TDM slots too narrow (tdm=%d params=%d)\n",
+			dev_err(dev, "TDM slots too narrow (tdm=%u params=%d)\n",
 				tdm_slot_width, params_width(params));
 			return -EINVAL;
 		}
-- 
2.27.0



