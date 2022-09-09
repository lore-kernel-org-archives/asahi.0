Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1177B4A2D
	for <asahi@lists.linux.dev>; Fri,  9 Sep 2022 15:33:09 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id p5so2255255ljc.13
        for <asahi@lists.linux.dev>; Fri, 09 Sep 2022 08:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=lP9I9C231dArXcMlyocTl/qVE0j3Pv37aaLeqVQ7UZU=;
        b=twITONxYLgPP9PxkRf8UDAvKbnLUZmH56aq6q+qd7igqBv9W6NMmSitWjOGWFf4it3
         LCQhRxyuGz4oj/8i+t3bY/DBVlHmyqeJ0czsSq2tS1agOxqtYqcs5Ig3ltIpR6JSGpaG
         rAHgebTzPRAZdHLod8VnLOin5og/nVCVDoRaWHZDhDN7SxfzFnushm2QkPMUEdyI31pC
         gFoixmPBfD30PnD+gsGvzQ5X4e+hbsCfU3XyyEGO6r6UMEdTPcZ0IlKDhU6bF/gGWecW
         BD7jLpreMkNBMcqA7so5sDsOkQ2C+OoxBscwm81lyVy7/1FNFUJ+YfZu3FCexn4K2KWu
         VWOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=lP9I9C231dArXcMlyocTl/qVE0j3Pv37aaLeqVQ7UZU=;
        b=WBMclH69WM3wc/eiKYOx14CuiK1U7gFFOhFlPBZK8v9e1hAgQIsh1XOuteyN9hgM7f
         vwt+vzB5nKdiAWwoxZfR0KY8I+d9v3+29v6eJYGYOUpUX2/ankoh3TOwIeAPWn9ABcLa
         nBz0RSZSowpKnqQyQUEMzOkepN+wVMvu4vVB6JHpTWLBcB204zgc1qwEP6WEjv1nZv46
         jRtJqnFY98jS6qHTynQn7a5pyqseECSso6KUBABSAHJT/RGWVEjt098I6gIaN1wlTVcG
         1Gm3uwKCbGaLIFQ7UOkxmTMdxqFk8GwE7loP4a8/NxWlaVfw1K1rdbmg35CSRSsbksAT
         +1Rw==
X-Gm-Message-State: ACgBeo1X9sggHz1GnOVaclpcAVwkhyswPqNyDOHxSrjHm+B61cVKjCqa
	qs7AFe8bkJTvkLNBPIK6CbpYNg==
X-Google-Smtp-Source: AA6agR6CrTnN/jL30qM2oy1chzWlwWkFSKzElgaz5C6XKHdy3uLj5jrCJc6y5+wmuCf2/Doyz1zYhw==
X-Received: by 2002:a05:651c:511:b0:266:c941:67ca with SMTP id o17-20020a05651c051100b00266c94167camr3956347ljp.28.1662737588111;
        Fri, 09 Sep 2022 08:33:08 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id u17-20020a2e8551000000b00261d6f45c2csm113367ljj.124.2022.09.09.08.33.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 08:33:07 -0700 (PDT)
Message-ID: <47eb92fc-f5ff-de82-aacd-91aa0fcc68cb@linaro.org>
Date: Fri, 9 Sep 2022 17:33:05 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 09/10] ASoC: cs42l83: Extend CS42L42 support to new part
Content-Language: en-US
To: =?UTF-8?Q?Martin_Povi=c5=a1er?= <povik+lin@cutebit.org>
Cc: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 ChiYuan Huang <cy_huang@richtek.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Matt Flax <flatmax@flatmax.com>,
 - <patches@opensource.cirrus.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev
References: <20220909135334.98220-1-povik+lin@cutebit.org>
 <20220909135334.98220-10-povik+lin@cutebit.org>
 <541b11a1-6b5a-cae0-73d9-f1fe8c961a15@linaro.org>
 <822926B0-CF33-4FF0-B234-8EF644DCED21@cutebit.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <822926B0-CF33-4FF0-B234-8EF644DCED21@cutebit.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/09/2022 17:10, Martin Povišer wrote:
>>> +};
>>> +MODULE_DEVICE_TABLE(of, cs42l83_of_match);
>>> +
>>> +static struct i2c_driver cs42l83_i2c_driver = {
>>> +	.driver = {
>>> +		.name = "cs42l83",
>>> +		.pm = &cs42l83_i2c_pm_ops,
>>> +		.of_match_table = of_match_ptr(cs42l83_of_match),
>>
>> This should complain with compile testing. Usually it comes with
>> __maybe_unused/
> 
> Which symbol? cs42l83_of_match has maybe_unused.
> 

Ah, I missed it completely. It's fine.


Best regards,
Krzysztof
