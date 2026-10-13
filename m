Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBBC3955D9
	for <asahi@lists.linux.dev>; Tue, 13 Oct 2026 04:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791865122; cv=pass; b=qPLkrqAPc37hkv+oraY2O4LvFxaTnOCOn9/eeRV7emxlVnM/dYtoQC+ofsdGLuV/ghD/5lsWMc51k27kQCMtrLoETi2WEGxWljzH1BMBZOHdH+whZVkFAAQlF15tyoCJKBldnODCEMWLp2bXTSO2Kmin9G54ghDvK7J1MDxdt4w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791865122; c=relaxed/simple;
	bh=RXTMOQ3s/A/fpHZbZ7Z1yCnaHYebzC4eV4sd40V0Aoc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ftBahvTLq5QCZ11RrMwlvP8JSkMeSvwu8b0pDc91Y6ACeL+49igD/mBS9yRg6niCmuMfj4BuhGZ6pVq2902sFBKENpafVas+uRjjp6FLZOb0lNT6QkBIM8pPK6FnC1pCjdoqdYgTC4sjAVrayOL4FpnhHAr0huuvGJmfAGTTW2Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rA3kN58n; arc=pass smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rA3kN58n"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc4ca696de6so1304380a12.2
        for <asahi@lists.linux.dev>; Mon, 12 Oct 2026 21:18:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791865120; cv=none;
        d=google.com; s=arc-20260327;
        b=U1JdBtqmtcOv+NjR+KSSEr7M1Y28LQ+rNjFmC7cJw7/WvtY588KsqTfJ8ZhMjVEUYN
         N5VniRC/Zwbc0sinqI3vwHzJNey7JYvmHmQJzYbUelQgdWIb/TpOBBu6BL+vkFYeBot1
         WsC3scOiVIn+TQMW22KIoU4VB+rsK+IJ7LSo3qsr/5YwTr5Mu32hRT6tqG/T1IvpW2XM
         KfY3ato4F8asnM3vQyM3sQbWa6PbPxnxgAk/m2VXiaUiaqmEALRQiwC2Z6GexGiKQiCN
         ukCXe+/u4wiBBOm2/Lks3zj+4LbCaGzuUlLDeJxmgKyAW8+lXTT1HscV9K9EM207V4bP
         TaPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RXTMOQ3s/A/fpHZbZ7Z1yCnaHYebzC4eV4sd40V0Aoc=;
        fh=atbNbaiCru1zcwHHdt0d9RDbRqq6WSpSf/WQbM0Hw+Y=;
        b=I3rbnbo77dhXcEzV9lz8bGefLb/gc/Qd9y8vb9bNE2u3CBGj4C+F05PqW2tVqnbaas
         YRe4OzoYDv/IujvtviQhVR0OcnNsqO5u9IQ8FtC/7U3plv1kpHQnm+VEJYnlHleO0Qcn
         LbPd/euB9D3T2t2WjIrevdw6dR9G89sOARzCUzzP4Ze+HbbV/lJUWXKevWPzQPB/OsX9
         anPXgRFv7jOXWFXeCNbYesamfDrAV/tMAD+4i74hQleuIBOdXmoZOWAA+HpvLMAVNsRQ
         x+C87mmD2645vhwVI5TeBbM2diIhl3aaNoN26nOiMNMIkUA9ygaRkpSTUhpZ4zXOKZHY
         vCAw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791865120; x=1792469920; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RXTMOQ3s/A/fpHZbZ7Z1yCnaHYebzC4eV4sd40V0Aoc=;
        b=rA3kN58n6WhWWCSJ9eyxQzNQxvdalF7niTq9VVMun/fvqel0+sK38ZFMEQtefDcaCk
         ScZVjjwLJDI+CknTAWyw3wddU/L0QJEceys6YV3kajUS0BSIt9askWJDaJiftIuio4gA
         WOspe0kUveeW5NjfHta1kq5ls7QCwddeDiXpKmWG8d1H+HxCllmBqfY3f572qRD/wFhs
         v23dk+VtveFUveNdAXmeSlFHa5Q62/Fk//QzCjwYlhqw74qFvs3v4ce+3Vt0O2jocGwT
         khU5II8M2iKRU3mbuHrsvmMXD3zMeh0p3q7ogu93gE/DtrTBIc2VYXrzW8AoMaekq78l
         WSoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791865120; x=1792469920;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RXTMOQ3s/A/fpHZbZ7Z1yCnaHYebzC4eV4sd40V0Aoc=;
        b=2z9YiIb+E+z2X+TMqVyaWpkkkv2S8PpaxlLENorhxXzjqm3H79JCkcHXC3L4VT/Kg+
         5/qJNwyQ7ckqDONPsGuAU+gjgWmQvU1hOXuqLcMNzSmcuPmsfeqP+JZ7ySzlOTyNYNrw
         7xrEUynSRWvoE9eEhi8yKXE9xmpd5Ok98XD9XzQININovShNqZKA0EStVG/WhwHg3Gkf
         FxHpdcs7uIiyswpzJq+Fo8bAo9TbfIiY72gFAUY5dWFHVRTsAuWpcyHWfUfS+s5NxBfl
         01vxJ/OacIU8oaJ8ipZd2n2z0ssqV1FGOn3Us/X4YLd5AzXd35YbCwPWCahq8hhV5WFU
         vOcw==
X-Forwarded-Encrypted: i=1; AKwUvBxWz6xl7TU0Z2SFqjMDrkXvHZ/e6lDOhsym+p5B0veauLT9l4oOZS33abXGPYfKw7chsSgc2w==@lists.linux.dev
X-Gm-Message-State: AFq9FYJRJw8yRO+H1C3Tlqx6mzGDV2iAcIn51GBh8IKpHEX/PyYN7IwH
	3Ik90uMImofqmwh5KyP9GU+BhZKFr0zXTqxL6XnlBXE7islsg3jt/+CUpRC+MpD9/2gmDoqJnsG
	z1GA4XiJfsKXlkwaqBDaanaGT+x7omEY=
X-Gm-Gg: AYBFou06wWrJRmiTzw1qDdpx9OI6dwy76OZikwUEKoW993agcLxOdymFmMGsxv0BdDh
	R+tMv+HQ29vT7tfDjS2NwJZv6oyudHHPeMVgk9tPilq7OwsG/SIPDSnJpbS0LifC/d/Xbwj+lWY
	8r/p+qF0cjw5rn0+260LJ+nFK2M6WOlnXoHTxH87tTUBhzjF4ztFDxNSF/Kx/4N9Gxii+9WiytS
	1h79omsO2ktOlCTJVywV+O0WDGgU1nYO3j0DOODlyxlzWbQZqxBpE/0RgOxNVQkJ6paiYVM+Zz7
	HeHiFl1XbVISTt4iLSXzPZYkJuKLkUALo6lVBJKAjtOnfQvCrhGKIBxe7KbPalJ2yEEIHHPkLk3
	m1dmB9jb+O602BaM88PYf4df4IMBrv2xKJq+bZ6u7NqfZT2IU+PZXxz1zQlFxmZ8s4vE=
X-Received: by 2002:a05:6a21:4eab:b0:3e0:de06:126b with SMTP id
 adf61e73a8af0-3e16beff287mr10686193637.66.1791865120247; Mon, 12 Oct 2026
 21:18:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261008103831.542533-1-phucduc.bui@gmail.com>
 <20261008103831.542533-22-phucduc.bui@gmail.com> <87o6cyxyau.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87o6cyxyau.wl-kuninori.morimoto.gx@renesas.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 13 Oct 2026 11:18:28 +0700
X-Gm-Features: AclHuK8E-95w9dmy_Nn8Ii2RGxOq8D0J-l4YT38o4WK2kAtoUqqhMqA48tZbgYk
Message-ID: <CAABR9nHvCfabGfBu85bm1r=hP3b0ZiCsgZfShhOv3gNUfjjhGg@mail.gmail.com>
Subject: Re: [PATCH 21/24] ASoC: renesas: msiof: Fix msiof_close() being
 skipped on rollback
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	povik+lin@cutebit.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Andrei Simion <andrei.simion@microchip.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, 
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Heiko Stuebner <heiko@sntech.de>, 
	Kees Cook <kees@kernel.org>, Syed Saba Kareem <syed.sabakareem@amd.com>, 
	wangdicheng <wangdicheng@kylinos.cn>, Chris Bainbridge <chris.bainbridge@gmail.com>, 
	Linus Walleij <linusw@kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Neo Chang <YLCHANG2@nuvoton.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, u.kleine-koenig@baylibre.com, 
	Pengpeng Hou <pengpeng@iscas.ac.cn>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Hemanth Selam <hemanth.selam@gmail.com>, 
	Md Shofiqul Islam <shofiqtest@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Zain Aboobacker <zainaboobacker33@gmail.com>, Sang-Heon Jeon <ekffu200098@gmail.com>, 
	Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>, 
	Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>, Bo Shen <voice.shen@atmel.com>, 
	Vinod Koul <vkoul@kernel.org>, linux-sound@vger.kernel.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
	linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
	linux-rockchip@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Morimoto-san,

Thank you for your review.

>
> If so,

Although I don't have MSIOF hardware, I tested this on FSI hardware.

I added a .close() callback to fsi_soc_component and forced fsi_dai_startup()
to fail to trigger rollback in __soc_pcm_open().

When fsi_pcm_open() returned 1 from snd_pcm_hw_constraint_integer(),
 the .close() callback was skipped during rollback.
When it returned 0, the callback was called as expected.

>we would like to have such comment to indicate such background,
> because it is not intuitive for people.
> Otherwise, someone (maybe me :) will return to the original code.
>

I'll add a comment to explain why the return value must be normalized to 0
in the affected drivers.

For MSIOF, I noticed that snd_dmaengine_pcm_open() already calls
snd_pcm_hw_constraint_integer() for SNDRV_PCM_HW_PARAM_PERIODS,
so the call in msiof_open() seems redundant.

Since the first call succeeds, the second call should return 0.
Would removing the redundant call be acceptable?

Best regards,
Phuc
