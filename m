Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E96027F4D5
	for <asahi@lists.linux.dev>; Tue, 22 Apr 2025 13:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745329464; cv=none; b=ZSI/QA130bG3abIvTwg9D7NXbcf6lL0iDxIZY5jtecZm3fEFS2Ww8jElrxrwTsRCj7ihkuIgJgcFYO4BtNY8nGlYZXWE9+R1re4WpLwWFtER9CvmcgAAMDtpM3QSgA/jc5zVKJuOI/R8EM8WGTYE8KORoAI0b5eHqc1d/RbMtG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745329464; c=relaxed/simple;
	bh=5ENscGsvk3ZZR1O8F9yAZWCSbYmjejJQgKz6FhofyIU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U2SDV5jYV1K5rBb1INpsd+zx4MjiWqTBzzX94PnmF5113vGesFeIjh5McAMxbRTiSzvD6TGwflyTEGRdTHZd1uXce9qof/p4KZu9yw+UwOa6wwTL/ppAqqStjxmh/XYq1yU638w3Wms94W30px7f71abkakL2HIITMou+5NFMxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KlLHxc8o; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KlLHxc8o"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6feb229b716so48540477b3.3
        for <asahi@lists.linux.dev>; Tue, 22 Apr 2025 06:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745329461; x=1745934261; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=01iWsWRnKaXYUJ6i/NON00y6jMFX6UcPEC4jPm/g2hU=;
        b=KlLHxc8o2N6lqquMfeRyOc4qzr1Pnxz/RQa9W1UX9cRiuCvXWuReiyJWtp00WVlTpI
         og5rq7Bu6ZudahFpZLoFMEwWa0rXliSUpi537+pQC8e6xedc3lq9NVAZRkZcyLTZylBq
         /k2Y7foOk84NGGwUZZo/FHnJaBGIfxfmlN05Ny3vLsGLMI5kOeF+DOgHZjjugwlBqo04
         qS6qKYAqzwsRk+URV3aQGYKW16OeM2EMfO6E8kBiKckU3cT48lvLNDCUNXi2NUaEVdJX
         WDqWKfEazM3fIpBxrc+kG65yP8tOu+tifP/s911z1A5sunmi/GGp54aPReNbghpehH46
         mAGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745329461; x=1745934261;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=01iWsWRnKaXYUJ6i/NON00y6jMFX6UcPEC4jPm/g2hU=;
        b=Wmcq4hFXhTx8L6/hEAV2W1P9I54j43zvZPYfd3pcS6lU5vnxM9uZsrQ86/chO8bVCk
         gIxgdvZQ685oFMyZDGfgqT7W1SeZYy2anl1Y5K/zu9Hq/8reXkNYHHqxDMygWcYbALIM
         nYGnnzBMbKYkSPnFoeVKEg3duPWOiLdU8scMUbSQpr5+0vLoocVJuozJW6fwMHmPMDDN
         BH5gjgOpPEonArxDQGSgACl0vbRnGXlQ7KVY1HoV2jOrQppxHDEaLmT8feaXW6fQkQFp
         RoXdxMdP/DTtDFo8EbViYLnkBibs6kA6jayFHs11aQVGME/m+uyoAZUeHKN4+BWr5Psl
         CtoA==
X-Forwarded-Encrypted: i=1; AJvYcCUZTAYalDF3XmkzSy6Y4yVJ5ldtBZrNYdCaOPT5R9GMus5G4AOdc+4jmkmAdYIkgkOPIC4BLw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6TTRTk+gdS4IMqkRQ+C7I12BT87NmzYzHrGINFQYSJwP3JMwG
	Xz8Oo33g1NsmdTxxxAYnHShbsddJnNKylbgrnF0GtfzAwbori+HXPuu91OnpUXdmTc5DunbM5Jt
	MtHHGKDfaWS+kc5fw/83TjGG8KRY=
X-Gm-Gg: ASbGncuQWVwxVFz52kH57yyjvV5eYop1GprK2NLw/iTx+mFgQhsfRA9Vg2pLwnGw6Wr
	TGyBLZbuE2lK4Kz+HwV8Bjc8fRrrwTECaZxd4pcPSaxxXSpVnyqHl/eRoXLC9KoXoVfPWYkolMP
	ebXLcSCuohs1CnDNbBq10VatU=
X-Google-Smtp-Source: AGHT+IFB0dsAITdx8kdX4E2ydKgnUeAe4cFVnylPhUhldLMfCcBI8Xtwn4NktwjCacq5FAj+GCAiAMlZsGz4uy29IlY=
X-Received: by 2002:a05:690c:6f87:b0:700:b007:a33e with SMTP id
 00721157ae682-706ccd0a2dcmr235402417b3.16.1745329461380; Tue, 22 Apr 2025
 06:44:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250417-spmi-nvmem-v2-0-b88851e34afb@gmail.com>
 <20250417-spmi-nvmem-v2-1-b88851e34afb@gmail.com> <20250422133619.GA1095169-robh@kernel.org>
In-Reply-To: <20250422133619.GA1095169-robh@kernel.org>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Tue, 22 Apr 2025 15:44:10 +0200
X-Gm-Features: ATxdqUFsls2M4OH434tZGU5ecAW3B2mwbfmPhFEi7JO7p4M-mTLMLWRteEtCKs4
Message-ID: <CAMT+MTTwY=z1-_94ws+Oi+wvE2PA_s57dPmpMABC26q=MPw1Mg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: spmi: Add generic SPMI NVMEM
To: Rob Herring <robh@kernel.org>
Cc: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Apr 2025 at 15:36, Rob Herring <robh@kernel.org> wrote:
> > +title: Generic SPMI NVMEM
>
> What makes this generic?
>
> A generic driver is great, but "generic" or "simple" bindings are
> generally a mistake.

There is nothing apple-specific in that driver, just re-exporting
several registers as cells. If you think that it is a mistake, I can
rename it to apple-pmic, or something similar.

> > +      - const: spmi-nvmem
>
> What happens when there's some other feature of the PMIC exposed that's
> not nvmem?

If you have a PMIC that needs more features exposed, then you'd have to
use a different driver. Or am i not understanding the question correctly?
