Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F55B4C62
	for <asahi@lists.linux.dev>; Fri,  9 Sep 2022 16:25:32 +0000 (UTC)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2896qFNo009110;
	Fri, 9 Sep 2022 10:55:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=3nHT9uBcMm+Mg6mZ509Ukrc3RClGASZLYFpwg58jTGE=;
 b=q44sG+gY/lsPHBrCOUP9ij9NNoi6qLerKsYnCAC1xTgMMribA0s/oERPxSBmAN0mndrq
 PQLuwqJXl8iJxn8J7bM2LLSiSBLYB2Yrt9O+jdjw0B7ziPc+ESoK3mmRwm3Lddoqgu+p
 PBFm6W2lVIGndfsEFK6aA+YOmaN7QG9eqoMDZgmamGRXJu4rPCiP2695debKqeW0H6Sd
 2qyIiCz7Xk/WxHl0KIfYjlmUNoCo8RNcJhCygFPMbyaL4Gjm8/QjA5oLqSBpHPvO1nPe
 BM/iOsk5/bXiplWteN8UMeZe+18u8CV+CUwNSx2CqoccqJYX7BANkxhtV7bR5TNpza8a 3w== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3jc3bq1774-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Sep 2022 10:55:49 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.12; Fri, 9 Sep
 2022 10:55:48 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.12 via Frontend Transport; Fri, 9 Sep 2022 10:55:48 -0500
Received: from [198.90.251.95] (edi-sw-dsktp-006.ad.cirrus.com [198.90.251.95])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 87CF72C5;
	Fri,  9 Sep 2022 15:55:41 +0000 (UTC)
Message-ID: <20342329-8525-9081-e1c1-f67067883c72@opensource.cirrus.com>
Date: Fri, 9 Sep 2022 16:55:41 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 04/10] ASoC: cs42l42: Split probe() and remove() into
 stages
Content-Language: en-US
To: =?UTF-8?Q?Martin_Povi=c5=a1er?= <povik+lin@cutebit.org>,
        James Schulman
	<james.schulman@cirrus.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        "Lucas
 Tanure" <tanureal@opensource.cirrus.com>,
        Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring
	<robh+dt@kernel.org>,
        "Krzysztof Kozlowski"
	<krzysztof.kozlowski+dt@linaro.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: Charles Keepax <ckeepax@opensource.cirrus.com>,
        ChiYuan Huang
	<cy_huang@richtek.com>,
        Pierre-Louis Bossart
	<pierre-louis.bossart@linux.intel.com>,
        Lukas Bulwahn
	<lukas.bulwahn@gmail.com>,
        Matt Flax <flatmax@flatmax.com>, -
	<patches@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <asahi@lists.linux.dev>
References: <20220909135334.98220-1-povik+lin@cutebit.org>
 <20220909135334.98220-5-povik+lin@cutebit.org>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20220909135334.98220-5-povik+lin@cutebit.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: sCliLYKo1kOmkbqQ3fdYLmEc-YZZcr8n
X-Proofpoint-ORIG-GUID: sCliLYKo1kOmkbqQ3fdYLmEc-YZZcr8n
X-Proofpoint-Spam-Reason: safe

On 09/09/2022 14:53, Martin Povišer wrote:
> +static int cs42l42_init(struct cs42l42_private *cs42l42)
> +{
> +	unsigned int reg;
> +	int devid, ret;
> +
>   	/* initialize codec */
>   	devid = cirrus_read_device_id(cs42l42->regmap, CS42L42_DEVID_AB);
>   	if (devid < 0) {
> @@ -2320,15 +2331,15 @@ static int cs42l42_i2c_probe(struct i2c_client *i2c_client)
>   	/* Setup headset detection */
>   	cs42l42_setup_hs_type_detect(cs42l42);
>   
> +	/*
> +	 * Set init_done before unmasking interrupts so any triggered
> +	 * immediately will be handled.
> +	 */
> +	cs42l42->init_done = true;
> +
>   	/* Mask/Unmask Interrupts */
>   	cs42l42_set_interrupt_masks(cs42l42);
>   
> -	/* Register codec for machine driver */
> -	ret = devm_snd_soc_register_component(cs42l42->dev,
> -			&soc_component_dev_cs42l42, &cs42l42_dai, 1);
> -	if (ret < 0)
> -		goto err_shutdown;
> -
>   	return 0;
>   
>   err_shutdown:
> @@ -2337,34 +2348,69 @@ static int cs42l42_i2c_probe(struct i2c_client *i2c_client)
>   	regmap_write(cs42l42->regmap, CS42L42_PWR_CTL1, 0xff);
>   
>   err_disable:
> -	if (i2c_client->irq)
> -		free_irq(i2c_client->irq, cs42l42);
> -

These 3 lines should not be removed. cs42l42_init() must free
the irq in the error paths.
