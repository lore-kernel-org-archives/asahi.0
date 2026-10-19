Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584184F5DF7
	for <asahi@lists.linux.dev>; Mon, 19 Oct 2026 13:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792416973; cv=none; b=TqU1mKKwrVgag3O+mj/wmx42VCABAnED74axs9EmjA6QxG1XY/Ky9k1V1s6VyFmB8815qpfyUMLjwmgbrEDiKaCdfAGkCZn+NChWOgk5IZ3ZTWVlVo2LjfYp6VZHuJXITAH5MDlTTPyTxvvuFpZfvj275Ls3v3nTWpuz31/3fa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792416973; c=relaxed/simple;
	bh=0YRsJG0zikzQGyPZCwNj3fX9FQhaRP08kplHGzoklOk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=StsSelRPunrOW7qjE8GZKscYo/+Egr/HaqodgbPnW4DyL65JRAM7oTptMWoI6G0erAgHai2L/NEjY4HgpH75y4b4kMi1bwU/zzhAh7UmC6Y3/jSjxk0z8s1WIyB0IQhcvnK3kZZiRKgL7QAPrd3NQXCee5HksaBQK9q96LHQLQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=B/61JcDf; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="B/61JcDf"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48df4f540ebso1141856f8f.3
        for <asahi@lists.linux.dev>; Mon, 19 Oct 2026 06:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1792416968; x=1793021768; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u7QI1RqFBazH73cHjUm3bJRQ468s8YNQSYzETjY7O2I=;
        b=B/61JcDfVa5qOuBWop+pj9SUt1LQU6/+77DEl+vTjuBhRGFXfIybOIFuhm1v7ZdboD
         NMO98gTAnWynRGF7A01EXUwqEuIJ8aZl+FxyiGv0pyViUSBLBxg3qZEVbypP10RiiDBr
         TXSZZDywhBMak/k7uauupJGRehJFJLufRm96bw+ZryXiogTKNS3N9p4+BGJFIdPcewHT
         oFRBhWs7vl89vy2NK/t2fLVX5TDVorAPQWPVUcj81Wo8+j3/jZLixvBgWh8rl0hcx1Qv
         227NbACElu4Ll93QPI+1GRSGemoiGALSgykG0wl+Szm3EHvU8nGdo2TBaSJshakgWCUi
         4+mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792416968; x=1793021768;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u7QI1RqFBazH73cHjUm3bJRQ468s8YNQSYzETjY7O2I=;
        b=OEH2+QORhFpk83W54CSV6NSElyOgDEIajwl6ytl/5sKr7/xuPXOr8jGIYCGPbD6sC6
         TYOzIohhGJfXoRroqOCUzv9fnDMqY8HFX01VMTlgWyLN1SfgncrHN8C+6UmT6FxPB414
         pj0g49puqN4okzA20GqE7L7EeyXJMwnbh8xOqqImIdyXQZl4mDY78hCNhBNPn6oX0OsS
         kaxHdZD2kH4OODlhAUXIXlKFLspFU+KKQO8sBq50Opt73vjn3+ia8jiF198azR9zkAJn
         r2HHrjZKK9R2m/9yeSFeO5//gcXl5kbDoLlqs0KgYFGPBY7I6sZIyFt7h/2Rit5LlpWQ
         rusA==
X-Forwarded-Encrypted: i=1; AKwUvBwDou7hOapk2URX7EB9ZP6p2ATSpazgMbn0EFJFzD3C+1Qw9TfrJc22gL2B0ff5zyZLsVH0fA==@lists.linux.dev
X-Gm-Message-State: AFq9FYL3VPqpXIbMecIwiB1hlX9szjgvn2t1Hanpek9m1QsFyYh5ARTn
	GJnL0706e63XsS07lagWm3qoGhtH0eZwmgut/DH+mjl1/nSYpeCRDPFU1SF/mgftOD8=
X-Gm-Gg: AYBFou0I59eSRuetu5AthL/kJHyehZ64Re+0aKiqYQjKlDN76t1oBKuQezcOFK8+x1k
	SWAu1Eax6jLMKfS97akF/tTIijW0nfNnfWOvF0N5KjE2TP6/f0fqr0l1/KLqKaUeHlxK62XnHUW
	Sz68MVyyjn/wQQNZ4phtP9zv9fXeXpn4VH+tvvTDjKBl+Fz8bUkBXy59bQvDJt+5939+epj6WKB
	YSN+MBHdjwWQ0afMCaFo86IaAY1RCmj4qdx4QXDFSooOP6EUYI5kCcigl7aFnm4DIl7iiiLl37n
	JE9grvgmVnQeY6Yk5ik4nmsCtMlCaE1KRPFybk2qGS9f/tmkwHoOKGHB5x7w5TZnhinraTwn3wm
	i1jmvqlsGrfrRhramPa6jNCgpqo3K7d2oOgUJysv570Ht8QAtf+kQ+2Q2rRfOgxsjIpkpVa4KNx
	ws2/uaOWeTFUOmKbhSPd1jZ/4CvhFD6IZiusFla1irNl70YYqJl13b4yr4/8uVBAeTN233emDC1
	fNWofkb
X-Received: by 2002:a05:600c:c168:b0:4a1:ed0c:f051 with SMTP id 5b1f17b1804b1-4a1ed0cf21dmr30497355e9.5.1792416967770;
        Mon, 19 Oct 2026 06:36:07 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.221])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f8cfesm20387473f8f.37.2026.10.19.06.36.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 06:36:03 -0700 (PDT)
Message-ID: <0cf7bef8-42fd-475d-b47a-9cb8629644ed@tuxon.dev>
Date: Mon, 19 Oct 2026 16:35:59 +0300
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/11] ASoC: renesas: rz-ssi: Explain component open
 return value handling
To: phucduc.bui@gmail.com, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 povik+lin@cutebit.org, Andrei Simion <andrei.simion@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Heiko Stuebner <heiko@sntech.de>
Cc: Kees Cook <kees@kernel.org>, Syed Saba Kareem <syed.sabakareem@amd.com>,
 wangdicheng <wangdicheng@kylinos.cn>,
 Chris Bainbridge <chris.bainbridge@gmail.com>,
 Linus Walleij <linusw@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Neo Chang <YLCHANG2@nuvoton.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 u.kleine-koenig@baylibre.com, Pengpeng Hou <pengpeng@iscas.ac.cn>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Hemanth Selam <hemanth.selam@gmail.com>,
 Md Shofiqul Islam <shofiqtest@gmail.com>, Bjorn Helgaas
 <bhelgaas@google.com>, Zain Aboobacker <zainaboobacker33@gmail.com>,
 Sang-Heon Jeon <ekffu200098@gmail.com>, Bo Shen <voice.shen@atmel.com>,
 Vinod Koul <vkoul@kernel.org>, linux-sound@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 patches@opensource.cirrus.com, linuxppc-dev@lists.ozlabs.org,
 imx@lists.linux.dev, linux-rockchip@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261016040946.521195-1-phucduc.bui@gmail.com>
 <20261016040946.521195-10-phucduc.bui@gmail.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20261016040946.521195-10-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/16/26 07:09, phucduc.bui@gmail.com wrote:
> From: bui duc phuc<phucduc.bui@gmail.com>
> 
> Add a comment explaining why .open() must return 0 on success
> to ensure the component is correctly marked as opened and
> prevent future changes from reintroducing the issue.
> 
> Signed-off-by: bui duc phuc<phucduc.bui@gmail.com>

FTR:

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
