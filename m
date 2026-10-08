Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BBB4973B6
	for <asahi@lists.linux.dev>; Thu,  8 Oct 2026 10:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456096; cv=none; b=PkctcdF1NFrUfZ5svFwzEsZmriiF7r7ut+2TDuDpPMz+kCeCDPQ/IWb4xFs5I9T6zjIX4DrYQQCiuwKuNJEZk8qBJthIxgnBguIipzW5igAeO0a1CD0iPymFSSN2Fb2iChNU9jlMIia2nwDvtdtOI+KpyunbDlaMmiqcvpHsFYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456096; c=relaxed/simple;
	bh=8WzS97708KAARSjGgVArWT8GbYPNjIQBiN6ygCWPQv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xjf3hHJet/+0DipVBP+Ug1Lzdz8UkuvXCdx1LEGFy0HQgUW0juyarNxY4/0rk3IXs6WueTZL3AWrBUVB2VsihzEy/Lx0fRLvUOEXR5iGb664Wee/4U3EPfrcvmJSN7UkabaqG0IeltzFm3vWMe1xHCSsaePCHNUD8ThwbCEUcFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qjz3YRjh; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qjz3YRjh"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-34bb8b31647so7926929eec.0
        for <asahi@lists.linux.dev>; Thu, 08 Oct 2026 03:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791456095; x=1792060895; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v/S64Lx6xVOJYbkzotXNTKtSzFgcjJur08r/Jkt4vOs=;
        b=qjz3YRjhlCqYHibcO53zQO5snAwNYqhDjYgDZ4F4LgyiDr6IsHphrsea+yWTpu9TgJ
         xbUJClKt+pDqWPf/KRRWCLvoTm29Wu3ixezyVMZXKDbQXp7kQE3NNapzYVwAX5NzMHU9
         2srZhKAwpT+3JPdwEfzhz/9MktYARAtsuSlRvX2KbyHg7lWv5QN2PklYFP8VFOGIOUBr
         jjJneZwczjTQB0HJ81jY7YiDBNI39XIKvQauzeUTbj/JWVwOhzTndyu5ZK/fkjMcwT5h
         Ub+maSG7XR15T/+GMGm4FRj0b7J/JCNmjfGr1hJLDuwsLXyFt7Qhdus4+LxyzIras/mM
         lL5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456095; x=1792060895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v/S64Lx6xVOJYbkzotXNTKtSzFgcjJur08r/Jkt4vOs=;
        b=dnHrPpNqLNnZJYKG8FS9wAhdrrpdLZniC7qz4TBUbb3RhrKQFFC5S8HrquChvTDCY2
         QNrlujA/aTSy/HanMKd5sn+EzTlGltqPfIGoPldLWxk3FQVdCsMo7Lt652/wFjWHXsET
         wsWgTkpYhUAVdQEpyOe09ypcw/GsXTQkgKIsS1+dijtQ6ZoJTd3YgoDLlw8yg+JTXooW
         wevRZk34P+hFdr7vuHK9pOiXX2aEf8UyJtXuVTEsDs6pf2tM6LmgFDj/UQSApO3TDBno
         9t+Oa5kmHxo+OwcnSCwxPO/oo9xDGL24Cy8ibtDwSA0ONDVk1K8TBMVpWk100sP/T5iL
         f3/A==
X-Forwarded-Encrypted: i=1; AKwUvBxIeL3y51xSrI1y6oS21lDyPRD3YTc9yVhDee4sj2+9219PQx9EZBME3YHBclCg0tkqeEwcYA==@lists.linux.dev
X-Gm-Message-State: AFuF++kyHgCT7hNAoXCnCRhvhej+Xe5TgDf6R2i9W9kQhP5COHFcc12v
	48cugjd9CojD4weVXuku8+KFkLzWbJhfoIGwr/SuvO2d/kAczi7FbnVC
X-Gm-Gg: AYBFou22Qro9dtBwy7X5Zk8POynlSg88FhDd4+0xbnep2bqORt0B+N0m/PREIlLYuMm
	JBlXqKAcYUwr39TIYuRUT7RpGxoFsKOfrlj8JDBg5zxX51kMoZcKaC/bHaWre9a64UW/YTRYrtG
	JiVB5mK5OpGLc1bgxvoQ7Nu/qTsKWOauBU9bpsJrqchjdSwj5EyVpdktFgmi/qA241iSxyUKvhb
	B9tfQrBTISPejciuDMUdbkrskQbt/SyjU7IioH+AR6laSzF0KriqvWW6zG2v8+A7eg3bZZywNyy
	YkJ/LA6HB05lbbcF8L2/fugXrtFPScq/rkXbNZuVa1kC2MF9iaGWAg8P+jklBdFsaE75HiEouH+
	9CeeZe+CnOus4wtZWcpW79TDgMGKpK61GC8MkGSgBujdVRfIuwNPMAeZHRor6SxsaWBBAwHop7c
	8LZq8J4bbJpcnT+hwIYdvAbai2RYgwY4gTUMIKLMB/V+ii5WbNDHK8IuaH5rjXM/kq9dPwHyOnr
	zdyEFEpp4cfeIjs4bibCfneJJL5Y/61WRLh6mJ5aRpgWEm1PhVNveDDBlpGPhbjR0dyr7Taga4/
	p9uKkPFhPwR0Zw==
X-Received: by 2002:a05:693c:895c:10b0:34c:7e54:65e6 with SMTP id 5a478bee46e88-3515db9c59bmr5695422eec.5.1791456094502;
        Thu, 08 Oct 2026 03:41:34 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:41:33 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	povik+lin@cutebit.org,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Kees Cook <kees@kernel.org>,
	Syed Saba Kareem <syed.sabakareem@amd.com>,
	wangdicheng <wangdicheng@kylinos.cn>,
	Chris Bainbridge <chris.bainbridge@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Neo Chang <YLCHANG2@nuvoton.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	u.kleine-koenig@baylibre.com,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Hemanth Selam <hemanth.selam@gmail.com>,
	Md Shofiqul Islam <shofiqtest@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Zain Aboobacker <zainaboobacker33@gmail.com>,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
	Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
	Bo Shen <voice.shen@atmel.com>,
	Vinod Koul <vkoul@kernel.org>,
	linux-sound@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	patches@opensource.cirrus.com,
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 10/24] ASoC: codecs: cs42l42: Ensure the DAI is marked as started on success
Date: Thu,  8 Oct 2026 17:38:17 +0700
Message-ID: <20261008103831.542533-11-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008103831.542533-1-phucduc.bui@gmail.com>
References: <20261008103831.542533-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

snd_pcm_hw_constraint_minmax() may return 1, which is then returned
from cs42l42_dai_startup(). ASoC only marks the DAI as started when
.startup() returns 0.

This currently has no functional impact, as cs42l42_ops has no
.shutdown() callback. Still, return 0 explicitly on success to
match what ASoC expects and ensure the DAI is correctly marked as
started.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/cs42l42.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index b5d69d5516a6..f6e4bf6206b7 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -890,6 +890,7 @@ static int cs42l42_dai_startup(struct snd_pcm_substream *substream, struct snd_s
 {
 	struct snd_soc_component *component = dai->component;
 	struct cs42l42_private *cs42l42 = snd_soc_component_get_drvdata(component);
+	int ret;
 
 	/*
 	 * Sample rates < 44.1 kHz would produce an out-of-range SCLK with
@@ -900,9 +901,13 @@ static int cs42l42_dai_startup(struct snd_pcm_substream *substream, struct snd_s
 		return 0;
 
 	/* Machine driver has not set a SCLK, limit bottom end to 44.1 kHz */
-	return snd_pcm_hw_constraint_minmax(substream->runtime,
-					    SNDRV_PCM_HW_PARAM_RATE,
-					    44100, 96000);
+	ret = snd_pcm_hw_constraint_minmax(substream->runtime,
+					   SNDRV_PCM_HW_PARAM_RATE,
+					   44100, 96000);
+	if (ret < 0)
+		return ret;
+
+	return 0;
 }
 
 static int cs42l42_pcm_hw_params(struct snd_pcm_substream *substream,
-- 
2.43.0

