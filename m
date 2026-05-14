Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727C53A48CE;
	Thu, 14 May 2026 05:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778738393; cv=none; b=aT82qHXHUgPv9jmrAb1jo4Okw0R2HSo9dSDRLAzrO9boXV5QTIwUbToUkz+0bqomWiCHov7/qAdxGSP6xaRFgdAA3KZs0efUGxGoyPz0TYu8vtdYmO/mjP2uBc77GUO61+SKHq72yM0gJ5wP8aEooACKsxbCC34qBkHOvNMTNPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778738393; c=relaxed/simple;
	bh=eekMyTGqaYzrA3edzem1c62xAm8OrTQXGIliLNmLT30=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ntYFUzy4ZU358nKGzkwA72LFFbE5DETpoqlVCkMIL9T9r4JO6ZPNzABOlzErEW5QwKWmnxKbcEe5zYqwtHYngE5QDoqBZKZ0H3OsiZm107IeMruz3YNBSSPPMOzAiTEO4xplzsDphRH4EAudfTXUsFKSzjP2n5pojFI0UXYnl9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fYf8dvRk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fYf8dvRk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84C3CC2BCB7;
	Thu, 14 May 2026 05:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778738393;
	bh=eekMyTGqaYzrA3edzem1c62xAm8OrTQXGIliLNmLT30=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=fYf8dvRkuuicNo7+mDHvKuYrb5yktnlgW/LSSKM7yEWet3C4jtpwJnGLC7216mVlJ
	 Cu3SyIGPnxyjHwXSVbmWYd12oj9NeKZQgquMl9ID3VVZqvowbHuKiSDvEtl7frlxI8
	 l0birNgJrSKb2rbUPJJM6Ihfd/tzNnLUuNgWekWvkXeUodixJlhDSd0hBj+FCJgmP/
	 wVubcA6G1iMW2TaauIZHxux/JrbfcGdAmYM5NEnIAzDworKsxItZwn8OWiJxJ4ixp/
	 lg16mkJDOeSngDb3dENhedQgSi/ozZKRgL3qFHejGYl75dtvLYY27QUHf6CnHzckHt
	 oFsq6ixpH4FDQ==
Message-ID: <28af26ab-bb6b-4763-8405-e36fe3ce68fd@kernel.org>
Date: Thu, 14 May 2026 07:59:38 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] ASoC: Use named initializers for arrays of
 i2c_device_data
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Cc: David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Lars-Peter Clausen <lars@metafoo.de>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
 Support Opensource <support.opensource@diasemi.com>,
 Nick Li <nick.li@foursemi.com>, M R Swami Reddy <mr.swami.reddy@ti.com>,
 Vishwas A Deshpande <vishwas.a.deshpande@ti.com>,
 Peter Rosin <peda@axentia.se>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Oder Chiou <oder_chiou@realtek.com>, Fabio Estevam <festevam@gmail.com>,
 Kiseok Jo <kiseok.jo@irondevice.com>, Kevin Cernekee
 <cernekee@chromium.org>, Steven Eckhoff
 <steven.eckhoff.opensource@gmail.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Thorsten Blum <thorsten.blum@linux.dev>,
 Chris Morgan <macromorgan@hotmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Weidong Wang <wangweidong.a@awinic.com>, Aaron Kling
 <webgeek1234@gmail.com>, Teguh Sobirin <teguh@sobir.in>,
 Luca Weiss <luca.weiss@fairphone.com>,
 Bharadwaj Raju <bharadwaj.raju@machinesoul.in>,
 Hsieh Hung-En <hungen3108@gmail.com>, Binbin Zhou <zhoubinbin@loongson.cn>,
 Shimrra Shai <shimrrashai@gmail.com>, Zhang Yi <zhangyi@everest-semi.com>,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 Qasim Ijaz <qasdev00@gmail.com>, Sharique Mohammad <sharq0406@gmail.com>,
 Chen Ni <nichen@iscas.ac.cn>, Neo Chang <YLCHANG2@nuvoton.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Kees Cook <kees@kernel.org>, Qianfeng Rong <rongqianfeng@vivo.com>,
 Tim Bird <tim.bird@sony.com>,
 Bram Vlerick <bram.vlerick@openpixelsystems.org>,
 Peter Korsgaard <peter@korsgaard.com>, Linus Walleij <linusw@kernel.org>,
 Wenyuan Li <2063309626@qq.com>, Bartosz Golaszewski <brgl@kernel.org>,
 Shengjiu Wang <shengjiu.wang@nxp.com>,
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
 Xichao Zhao <zhao.xichao@vivo.com>, linux-sound@vger.kernel.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Markus Schneider-Pargmann <msp@baylibre.com>
References: <cover.1778692164.git.u.kleine-koenig@baylibre.com>
 <ae2ff4898eb340bd8bcafb7b75443eb4a0ce3e76.1778692164.git.u.kleine-koenig@baylibre.com>
 <65f6da30-eb20-4020-b13a-ac7d4c823dfc@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <65f6da30-eb20-4020-b13a-ac7d4c823dfc@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/05/2026 21:00, Krzysztof Kozlowski wrote:
> On 13/05/2026 19:23, Uwe Kleine-König (The Capable Hub) wrote:
>>  MODULE_DEVICE_TABLE(i2c, adau1372_i2c_ids);
>> diff --git a/sound/soc/codecs/adau1373.c b/sound/soc/codecs/adau1373.c
>> index 16b9b2658341..5dd961b233ce 100644
>> --- a/sound/soc/codecs/adau1373.c
>> +++ b/sound/soc/codecs/adau1373.c
>> @@ -1599,7 +1599,7 @@ static int adau1373_i2c_probe(struct i2c_client *client)
>>  }
>>  
>>  static const struct i2c_device_id adau1373_i2c_id[] = {
>> -	{ "adau1373" },
>> +	{ .name = "adau1373" },
>>  	{ }
>>  };
> 
> This is inconsistent with most (or all?) of other xx_device_id table
> usages and, IIUC, is not even necessary to achieve your goal (which
> itself is good).

After talking on IRC, I see that actually many of platform_device_id use
named initializers for '.name' and PCI uses macro for that, thus my
"consistency" concern is not really valid. Especially that if you change
i2c and spi tables, the named initializers might be more frequent...

Best regards,
Krzysztof
