Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793418096;
	b=31dRLXTenY9+EBnMWJ8bAKuA5vBVSmYdt+0e7rgo+vjvY8Amy8uJMFXTXbrGjS07yYSD
	 /w9T8yPDOlms38njYs5I/5Efxe1DODm5EQ+8u+7kz1qdw63uqFle3LG6Dyzvy5HiUm8a0
	 DHD+i5xkDuiyig5yBjJzvrfLy+5XAoUdQeg5vS9wKq0INwV77FgcIcysME7v7bOqdb/ws
	 WXH+V59k/JS15auymnDilJQxTF9AuEbfZQAQJqJuv3aoOVa4/y+tqmqhIby2mqn5a3Xa5
	 kAAX86EugmZEh/FKCE02LuhGQ2s4n7B3Pd0iel62TvyahrmcLFm/PAWHMQe3O71hOfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793418096;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=wZvy9SzN1+/ZQllAihZB3y4rVnQ1u74CJPCb15ddjFY=;
	b=WDCQqEjamS6+u5CIGrPYFQRUZaRyrpMhSWBOkHNTSOS0QEPfKw8kwwc4Fpp+MiGpeP0C
	 H7USxepV84Iw+U2HEGILGCIT93cu/xFtH07D7DA0M8bsf8zWr0lMbQJm852gGI0KfqO3o
	 99+PcYGam95XRlUN00cyv66nK4PwipjjTAX/eKd8RSJRxp1Bf87Hhi3e9a6N3mQr//bcY
	 56DPn0lQ3pfGqPhh3jjkQ9o7LzHRWjzmDrZiQXQM25JJdorzz1pamMgr4nezOA5DeaEb9
	 XcfdphkY34/Zc8WA5Zb4MYF20uenkZd834z9smm7KwCPqGPh+NKSJPjm0h16MudDbmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CtqYzvyD;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F912606A31A
	for <asahi@lists.linux.dev>; Sat, 31 Oct 2026 03:41:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F912606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CtqYzvyD
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36a2551d7b5so3111251eec.1
        for <asahi@lists.linux.dev>; Fri, 30 Oct 2026 20:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793418090; x=1794022890; darn=lists.linux.dev;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wZvy9SzN1+/ZQllAihZB3y4rVnQ1u74CJPCb15ddjFY=;
        b=CtqYzvyDrueJNsgHpn3V2t4WB0I5V2x/GnbbifyS1ypiKv5o9TTUWrXH9krNMDzj+F
         vjla2b4JU+ocDnw0WIbMnQMrrijTaSmcfxDcAu79tIy5eWPeat4+AdAg8+18jqAuO8/v
         k4RDtrguc6tnWcrg3aVXGM20XbkrrtDMbIQRJf3CxhtSdDVsgx1EH+HfGhVZpQ2Ki2Dh
         gH43MJyVJz2Hub3kK8uldxOGoWksRDZ6KSv/PEeiYLzKik/9fujumQca6pMteRBrvVpq
         NH92rh0892mqK2NuE98zFoGChtmYonf3Lmnig+xKDn1LiKhbOHfzQLypQXrDd6tLz1SE
         oefw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793418090; x=1794022890;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wZvy9SzN1+/ZQllAihZB3y4rVnQ1u74CJPCb15ddjFY=;
        b=AppdOaEaiyaWyzQVTukbjcsXqCz725vVO2tyiQkkD2IzPE0nQG9bx95YnCTgP2FAQM
         lpLyM5mzZPUYaRwZ/2HYu57pYbQc6Ha9AUdNPUdUezKq9quxtc4+7MUOV1SXh/gWG904
         Y2NLEGYIYbnHNPZ5Xi+MuCA4GE4S5FN2isjxXBp/sTdteMMXLoIqqmPvK+YtqVrQ07bt
         p+sQJaurTb0u9V57/3ZrEFFcP6wh94/ltz3YIEl9BWwOETJRae7TWlpNXbO/PyO++G93
         CY+MzzJ6DFV1I2YLywxCrJzM9x8US5OPeyDK2Nss0hnliasoN+AFO+eEYO0OGS1EC6ng
         axYw==
X-Forwarded-Encrypted: i=1; AKwUvBw3Hw15M1QcJe0OKCVH1/7DeX7CIC+gqOSctgeQAw+78yAaswYnMQHhM7s6RFwj1c0AGn3tsA==@lists.linux.dev
X-Gm-Message-State: AFq9FYLtpqRLWihe/dq241vUAj3MV5z+vtvXomkNWJK5qRPiG9rSv//B
	/k1WSd8PLxAAkHmpsr49rGO9vhQFl6RH8OBP/sVcQt6FJkm+ccya91pd
X-Gm-Gg: AYBFou3hMh4xOX/aIc2Sa6g8+VCa7mKOu+JGQPZY+QdDl0tqXLQUTwjDQfwVX4AHp2J
	vSaDw9EpSC2DVsC3xr5+TLWO5DzPM8DljyBAZrZprB/G1HN/+Ds04QHa7EiQB+yRIPYoNfAOp7N
	OLGJdl1WAWVZJmmhH6PkDTDLQF/2HHJImdN/yY1XRXuX9ISp6F2TLn012XK7H1xfiiDyv33z0Pg
	i4f5KVm2pL1shTCUHeHj5MKBAaKm4Z9xogfQO6PVqfz/+cdUT6T/fKs4n9NfWPXUqgSW+fFBTfh
	M2AWs5peIcdrZFNT2ScdOxqiCcIHNqi38sZxOQXF9AGB0vYItna/yXj/JxmVol74mHPcDoMN+mT
	8NaFwjEcRjE2/YepAmVUSp+H0QuU7IVgrKPBJHlpbzullYFcLPbF+rfGf4Q3SCJUqN/vOskunwk
	tLFdYQNygwTt2ulb301wyOCspzpu5aJecYYz+7rAHH1JEUf0pRFx3FQwKACC06CoMb8jSLSJvEr
	urCGBZH5tIDfaLZ4OPbKKNHNHLAmyIsG+FuGgbxA83SyBa3Az7TnKkl2+Vzyv5zfXQbSyLe4NRG
	dH9et8q5Gaezj8XqvgL+ZuyaSqiDGesoFIUrP513w7yTTPw8xwZj8NL8YLODHp3cxPECuWbj2kj
	rG+eM1j5pgKEd2jNf3Ovb8X1ln0mh/IOx1VYSXPQYqMuxQydAqElaEqFTlkPhnx8h+8bpUPGGkN
	NNwu9AmyeeFi4/bUViLlAT3jFgeg==
X-Received: by 2002:a05:701b:424e:20b0:194:e9e5:11b0 with SMTP id a92af1059eb24-1a9496c2e85mr10732429c88.14.1793418090155;
        Fri, 30 Oct 2026 20:41:30 -0700 (PDT)
Received: from minako.localnet ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42952e1csm13084809eec.20.2026.10.30.20.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 20:41:29 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Frank Shi <shifu0704@thundersoft.com>,
 Martin =?UTF-8?B?UG92acWhZXI=?= <povik+lin@cutebit.org>,
 Neal Gompa <neal@gompa.dev>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev
Subject:
 Re: [PATCH] ASoC: tas2770: Fix VISENSE at sample rates greater than 48 kHz
Date: Sat, 31 Oct 2026 13:41:24 +1000
Message-ID: <7grM17yBRo6a58q_Jnwbgw@gmail.com>
In-Reply-To: <20261031-tas2770-sdout-clkedge-v1-1-5266daf35f4c@gmail.com>
References: <20261031-tas2770-sdout-clkedge-v1-1-5266daf35f4c@gmail.com>
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi folks,

Please ignore this one. Will send a v2 shortly.

Sorry for the noise.

Regards,
James


