Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634AE30B514
	for <asahi@lists.linux.dev>; Fri, 16 Oct 2026 01:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792115583; cv=pass; b=hpHzQgvhGK7oAcT7cBezbrJ61/ZEhY3Tf56kU2mKRvJdZI1io0O9lDBfhX0RbU4yxiEE0bk+TllCJJZWlqItxZOzUyfM/32Z+GbRlGgLuyHFZN4XNMrbTHSYeIge8zrU6roGu6664ShrOQjRtMseX+5GTwkTe1/UcvXKH7UwC9A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792115583; c=relaxed/simple;
	bh=Ia+9qnQFXuT7Qa703XqyFy/Lx1I20mduDC3TrKVaE04=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tkQ2kvSQNd30IGgcnW1r95gxOqZ75xRLcePxqOSdKatwA24Cnnnqcah9UzTDLyanXV7aJjCLPTEpxbxYyDGiuDfP3Y0gFvsLMuIdEtcRmhArsT/etPpcs9XSf7ZPGXJJSBWIjMaJzbvuwIr0hdS9BKWNLllIE2zP5YleyYHy2OI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FpDrhJwK; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FpDrhJwK"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d6d28aa26cso11655715ad.2
        for <asahi@lists.linux.dev>; Thu, 15 Oct 2026 18:53:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792115582; cv=none;
        d=google.com; s=arc-20260327;
        b=W4JzWjaZFCwe0sp6q+HwQXpwm+jAEZPupesGnFq58WMNld2pcR3IiKsjdf7Wj0QH0u
         Rp2UYgbnWjKXQiSSGqaWCeZHA0gYEQrNeB5Y+GtpnZM5av2Ln4gfNl4DWEzNVTtVC0OK
         QvkoAxxH7W64W5pigDGFQOu0zNcNleX4CoaobO/Xei/5BRqMHpH0cMy8Ec1FzaQfTWD0
         rMADMqp5NRlvesvSfiTrGtI8yZAn9UTj6ADIjWBW+b4EZMgc9qjT+Qr2Hr8UeZ4eHmpz
         p/UuEuMD+IQqaM1R+GErSFufI5v1X58seaE9b9mGzxBUHAsyX1q09UDggcdJa5ckOBJF
         JEKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QzWh/mXf6G5Fr5INTJvXRytqPL/zBujlCdMkS18GyKQ=;
        fh=ZwbTcRfXIe/wyp3PorckhgoJEPxoK83BPdNvMcromno=;
        b=jAjS395XR2yi3BGeiGcuPnyH7aHMzO42edlfjll1j/fxD3Qhc0+tjqwfgEOGmI5d0u
         V/XEeCQMsB+wen4je84Vc/KJk2ib/P1zo1WFuNu1NEK0MMl+c7MPmhaOf4Efl5L26JQg
         v5pEKmZKfbTmNEP43hceK+myxu36WJqOVCGZk53pXMoMwIRTZT4w23/nCyUKdw6czIAi
         Csk9ukeG1VahpD8DHkx3EpS+DHvWfn7UlL+rn9BNsVczexcKv4XlD5orMK2tHtiJlj9A
         5aYNegyiiHENrvicIqsbEEecjBDG/dVta82lWkss/EGDjoXBGqXM4b8cPcZYR7Jo8SbE
         9nVQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792115582; x=1792720382; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QzWh/mXf6G5Fr5INTJvXRytqPL/zBujlCdMkS18GyKQ=;
        b=FpDrhJwKtPFc+ZeP0nvE9tHknUsT8wJbFnHv16XTc73OTMEIr963UwFhz/rsflTcYL
         pVMZt3yf9Bg0mZiMNxKqAJO/Cz45IC7aJfYtw0SO248NpSwSl6TzL0zM0e+jHQwfWa+f
         25uJdfWp/Wow3qLC8N9M8jMvVjYEwf8Ixmze0YT6R6ueOXshO+iFnqaEOczZuh9aIsf7
         atu9sQ+5G7JmcPkYjIoxVUqu36+6MNUTIcwzp8lUCLTXkfziBCUxAO+JSCf5BlPgW36n
         4pnu7A4ZcVF0+xHB65MG2H7bY/419i/8XJfTOJcuAnXy8uXFDnVuVk9t/dsQFjA0bvQN
         U1Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792115582; x=1792720382;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QzWh/mXf6G5Fr5INTJvXRytqPL/zBujlCdMkS18GyKQ=;
        b=VuVLYwMRyObXGtLoRRktqZwIaImmf2RZ6GGdzqRscJ3vI5Tr1I8m7qSz671qt8rFPo
         6ZwaZRx+DontKgKy5By0DjHDJxG7MqEEsTo8772dkABZjig7+/I4UQToKX5nWPmRPk2G
         xpR8zqpb6ksp64poggM3MqgRGWylFkZSommi0qx+8US1C93nYL6rSv+tS/OPlmLhcPjc
         fo4c7uaQPVtXK4yGiHfyUD0biM3plJ0egk6h23fvyIzCeM0naNxvias2LpB1jTLMer72
         /sbqWsv3ke87xbk8IbIVjB5koye1hOSg1bmqj7jwMmzwsV9LDo1z+0ASuj7qGbjoWxUF
         1mcQ==
X-Forwarded-Encrypted: i=1; AKwUvBy5XTJF0BwTqYpk0s/n4k8FuWOjfbM9BjH2pDjyJ4oxzb/TlIDTYax7hBC5FnpfTkN/3v3U1w==@lists.linux.dev
X-Gm-Message-State: AFq9FYJCJZtBBUbWmwL9N1mXYJN/3yTBSXFAonEefjsO+9b29OvFJOR/
	VrmAtVHPBr4Zh8T4dZPJUCmvPSXZaxqx7u3o0W2EoKFt8gtIIf+YXULc0TdR/EYuzwS8Aftl8Hh
	RWktL7nEnTT4XCDlNSlQFEoUoUQlh2x4=
X-Gm-Gg: AYBFou0fTAsnOOtqc66VUXCqLan+5HkyyINf1dGa830I7q7gQa6LdH+J6oSSetz4zw5
	pCYSOYjalmu7MQElaR4CTkyO9yQ/vgZfv+wq/RPXu9q0Wt+1sxqoxNJ+18puUBayHVXX3gFty5u
	3eEIyAKtll13L8l3Uw4iCfd8SFe8nR4yF9sTtcBQwJWoMrHyTvT4LikycDWD2isRxyHUTQYsVh3
	/xs0GyKmw85iPDm8C7nrQGmrQzlxsNZbZtEiec4EKNzhWfifbCS2mCJBZKJOoGUMTYVUo9YF6AE
	vdoy+u50WSfpf/EMprN0dWpzfOrZCxOADLqrjCplQhk+T/nmYBqxyMHx/GQezIGLGE8qyiIfnXJ
	rhIaGNBCNkqDlfyAmHUWadzHfh3oz41ULmczDniV7VFZOQX0/D/D3Sm4WuSPNNJaI+Ss=
X-Received: by 2002:a17:902:f641:b0:2e9:5714:608e with SMTP id
 d9443c01a7336-2e957148bb7mr48721225ad.49.1792115581670; Thu, 15 Oct 2026
 18:53:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261015014324.5569-1-phucduc.bui@gmail.com> <ad722297-5ca5-42c5-a07e-59fa958387c1@sirena.org.uk>
In-Reply-To: <ad722297-5ca5-42c5-a07e-59fa958387c1@sirena.org.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 16 Oct 2026 08:52:48 +0700
X-Gm-Features: AclHuK85_RuY5Eq4148HpcAJND7CX_R3cPSTmudMqJuFIrc_MXHUz5ZN3dyw0W4
Message-ID: <CAABR9nGU0qW6iMadffrXw86a=ty=FVhw_Ypoa4rQtwOCbepVWg@mail.gmail.com>
Subject: Re: [PATCH v2 00/25] ASoC: Fix constraint return value handling
To: Mark Brown <broonie@kernel.org>
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, povik+lin@cutebit.org, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrei Simion <andrei.simion@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, 
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
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
	Bo Shen <voice.shen@atmel.com>, Vinod Koul <vkoul@kernel.org>, linux-sound@vger.kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	patches@opensource.cirrus.com, linuxppc-dev@lists.ozlabs.org, 
	imx@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

> > Changes in v2:
> >  - Add Reviewed-by tags from Vijendar Mukunda and Chancel Liu.
> >  - Remove redundant integer constraints already applied by
> >    snd_dmaengine_pcm_open().
>
> v1 was applied, please send incremental changes for the differences.

Thank you for applying v1.
I'll prepare and send the incremental changes soon.

Best regards,
Phuc
