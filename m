Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794415017;
	b=DZOFDSWeSmyRc9U7FYmEEt8HaDzCBMQFLnA1gI9APzYDj9lasI/s1NCFtlC6y/kL57IK
	 efnPtxh04E5KBl3x1eOOz1XjffEWDkLVBNvbDzz1dANaMzpQSElrhvR89ki+Iwe/dU+cS
	 p5IqHIFQt4HmPHhyAANJxByhLjN8TA9Hh6tNSeKAB/LqK2P2jAjI1szfIiEU5qFOQDku8
	 XjRlDAZPiizAW3qIJskShZ8DoHT6DA/4kip4s3wzHXyokK4e9LgtIzZfMAQPB27iEtKc7
	 3H/4gWvfrYjo8XHVqgNeOSbvZgXu7Gbj/evZBro8Ev8jkgZvL1Dph+o2tMVludw8jyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794415017;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=7J+7rXZagAMwYFsd0caewFjx827wQhm990FgyJyWk9M=;
	b=m+zNx2xe9JPG1YAJIrZ/00O1AsdB01opyO/kggTC3mbdMvDioDl2LpT2IzZucfu50kEF
	 e9A4ZUv/qSOScH0xckI1iudXCjQouBivEfDUODUHkdiV2VFJWIwam4aGksg2nFZ2kkuR0
	 yBRbmD7ZD95u59vpSf7B07aGEbz+nNNO4iGWzv3dRs3oFWaISI2HviDWu4sOT4I7dFWo5
	 kdUeJNMf42v26mzlTtV1VFxw+nRlxt2JuUAbYw0blKuLHZM95fErLjTop2oOEVVax38lJ
	 xwXwplIfo7PbOEBttfNEw6Qovk0W237BjVAcJNe5VXYucHoysR+GqQpE9dFgIUH8whw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=XixXXYmY;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4ED3606A31C
	for <asahi@lists.linux.dev>; Wed, 11 Nov 2026 16:36:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4ED3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=XixXXYmY
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-491aaed7565so2012816f8f.2
        for <asahi@lists.linux.dev>; Wed, 11 Nov 2026 08:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1794415015; x=1795019815; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7J+7rXZagAMwYFsd0caewFjx827wQhm990FgyJyWk9M=;
        b=XixXXYmYD0zoYiGyrICWHL0hG4GnFh0GvBQdS3CM7JE4SAv0wALlclafumsYA7EuBw
         c4NmwirXPUeeAF2TDEVtdxCPOQx7Hv05KZWkREF3JrVBt7f/Uv2ldj1LricHqcO/2ipT
         OVWW8zmJQNfPbXTHAkElCWVWCTcIi/Gj+LJlY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794415015; x=1795019815;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7J+7rXZagAMwYFsd0caewFjx827wQhm990FgyJyWk9M=;
        b=SS1OVMIel+cAn721eUBViCx52fWXzbKdWnUks6XwovGYBvJ7bFFxn6DmfL9Bjdsobb
         0DCVeziFG13eVbWm+Vhs9zQ9DWTRLj+I145gmaPtRHwtzTJ6JvIJVnpambX3XbSf06F2
         K82va7Nd2R1Fkj2teiloc5SWVA+iSIHHeoW2HEtN51o918GDLnYVVwdOqCMCHgvUMoiN
         qPjtKGzvg8A/RNgr3Wj+gFPwMfVQJyXWecGTErxYGW1fqE+jDyp1629VeHpQN/Nr3yDW
         4DSRFdtI5bk4OsvD+7+MLanY6wQfmDhjR2dKGgQDbKrmqtmM3Nm9rYOl55PYuX/8D0wl
         u7tw==
X-Forwarded-Encrypted: i=1; AL+hErGtMusaMYySXd3Ym8cHbdSkr7IQ6uW+RaAQ+BYOWigvJ72Az0WJoeS1sSuF/bY45dQmW4eTKA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/qtT+/PKEe/IXr9FqgvJDbmhLJgjC6RPDAB9iqBiJ/54IcVz2/
	1dcx/xOAyPL/BU7QcFhOx0GJ1+yJsFdEfj7Qgcqr1TrfxfM7RPxdq0KDn9S16V6sg3SECRG6uC9
	3s0B1yah02Q==
X-Gm-Gg: AYBFou3Wnm8CUaLkg+JB33u8MjfgHBHCfcRI7wqDLnOGyOQmSPacjV1JviaXB648npq
	wFot/YdGiOaUh84J/N1YYa7t5pJzUywWza92ROjOm94DN5UlJF+BaxdYyecmVWSo3nl75T2iq2/
	rlb2KH+LwH9twrDzqwrcrpenQkHTB5hkq1bK5w5WNnmGGMkwAOhmNLuZAnr8/UTwhei5nkcYqKj
	X5WTFwWIfUXfMlTukj9ZSB3Y1LhV+r31yECM5VO/xC/i1KXJt1RqjJ6IENdtSB++m3Jntifu9wm
	sb8MfW0FllGy5spYaRBcbHk0FDVMX9GjKveT/slgKMY0ghMh+8RNym4vb5cQxrSHV9DpF4SOJRD
	Sl4YKrs3H0bJYS6zlCngiZiChg9evdpBn5pzaCBkHLiTShRAA6JtkaIivWX5Ppcse18oEHd8RSa
	YI0Zd4vapcq/w0AcZjZiB51lNWiznRDNIXc36xhxCRwfHsfUI63i1doj5+GJmY196fCUGO0Mxeu
	eVcOK2osG+84asiF/GulDDT7L29SBwRpmqsgGv8YdJpzcLkqiPZqNrXkpag8Lcp9EeoLnogbxh0
	urAwISqUAODFeCdBCjSXgCsfGvmxeiLmE7N8RZKp+C5YQAw1KiMNMs7qErU9N4g3lw7O7bVnxBz
	A9k1QKtK/mw==
X-Received: by 2002:a05:6000:2007:b0:490:1358:2265 with SMTP id ffacd0b85a97d-499c80de903mr5102934f8f.34.1794415015066;
        Wed, 11 Nov 2026 08:36:55 -0800 (PST)
Received: from localhost (dynamic-2a00-1028-8382-0206-0000-0000-0000-0a68.ipv6.o2.cz. [2a00:1028:8382:206::a68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498367ba82csm11933974f8f.50.2026.11.11.08.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:36:54 -0800 (PST)
Date: Wed, 11 Nov 2026 17:36:53 +0100
From: Roman =?utf-8?B?U21yxb4=?= <roman@amarulasolutions.com>
To: Mark Brown <broonie@kernel.org>
Cc: Peter Rosin <peda@lysator.liu.se>,
	Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	asahi@lists.linux.dev, linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
	Michael Trimarchi <michael@amarulasolutions.com>
Subject: Re: [PATCH v2 5/5] ASoC: pcm179x: Add support for pcm1975
Message-ID: <avSZpeqgC9Nh7ax4@garnet.lan>
References: <20261016-work-v2-0-9340b9555fbb@amarulasolutions.com>
 <20261016-work-v2-5-9340b9555fbb@amarulasolutions.com>
 <179304174310.199157.17471232393944903445.b4-review@b4>
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179304174310.199157.17471232393944903445.b4-review@b4>

On Mon, Oct 26, 2026 at 07:09:03PM +0000, Mark Brown wrote:
> > The PCM1795 is register compatible with the PCM1792A, but it encodes two
> > of the register 18 FMT[2:0] values differently: code 001 selects 32-bit
> > standard data instead of 20-bit, and code 100 selects 32-bit I2S instead
> > of 16-bit I2S. It has no 20-bit format at all. The PCM1796 shares the
> > PCM1792A encoding.
> 
> > +	{ .compatible = "ti,pcm1795", .data = (void *)PCM1795, },
> > +	{ .compatible = "ti,pcm1796", .data = (void *)PCM1796, },
> >  	{ }
> >  };
> 
> >  static const struct spi_device_id pcm179x_spi_ids[] = {
> >  	{ "pcm1792a", 0 },
> > +	{ "pcm1795", 0 },
> 
> Don't we need to set the driver data to PCM1795 like we do for the other
> DT based entries?

Yes, I'll fix that.

> > +static const struct pcm179x_fmt_table pcm1795_fmt[] = {
> > +	{ SND_SOC_DAIFMT_RIGHT_J, 16, 0 },
> > +	{ SND_SOC_DAIFMT_RIGHT_J, 24, 2 },
> > +	{ SND_SOC_DAIFMT_RIGHT_J, 32, 1 },
> > +	{ SND_SOC_DAIFMT_LEFT_J,  24, 3 },
> > +	{ SND_SOC_DAIFMT_I2S,     24, 5 },
> > +	{ SND_SOC_DAIFMT_I2S,     32, 4 },
> 
> Does this line up with the constraints advertised by the driver?  LEFT_J
> and S32 isn't here, but S16 is?  We're also not handling big endian.

Yes, the 32bit variant for LEFT_J should be here as well. But what
should be handled for big endian here? As far as I've understood,
the bit stream on wire would be the same regardless of byte order in
memory.

> > @@ -191,7 +241,7 @@ static struct snd_soc_dai_driver pcm179x_dai = {
> >  		.rates = SNDRV_PCM_RATE_CONTINUOUS,
> >  		.rate_min = 10000,
> >  		.rate_max = 200000,
> > -		.formats = PCM1792A_FORMATS, },
> > +		.formats = PCM179X_FORMATS, },
> 
> It'd probably be easier to just register different constraints depending
> on the device rather than having constraints in startup, you'd get much
> better reuse of the core code that way.  Dynamic updates are usually
> done for things that can vary at runtime like clock rates.

After rechecking the format list, all the supported variants should have
the same "formats" field, so I can remove the distinction for that point
altogether.

Best Regrads
	Roman Smrž
