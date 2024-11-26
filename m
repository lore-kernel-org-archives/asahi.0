Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D34178C91
	for <asahi@lists.linux.dev>; Tue, 26 Nov 2024 17:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732640472; cv=none; b=c5IBp7DJ0G8ijovUoLQstU1ps1/wNbfxPDYgQgBvedlpCHZ89IcbQv4vV9+fgRDgJ3IyNwhp47VesUxNJ45sePHblWp2dWmEZV1y9MO6j8MQa2ZhMvuSgq2SXWMW9JZ5DAWAr7992y/JNoYbRvckYjv2nfjiHfhnZTQU1YLr44g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732640472; c=relaxed/simple;
	bh=ZatdLTgZuMLhV9FfTllw/+llDgZAW17X6HodikMN+1c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hdddfLs+Ut5JG9SHVTXUjwkJ7xI4rXpsHshjrabTb1pPhb1/NDbfPO9UD6BScRucKqBXW52BLi9pm5lltUpBDbKPI19fVm27VPlpodDvNFDQmJxcn/U8aR/qHL6vC7wS+fxsQKjazQXnZVQsoQ429QXCF1LuHRFe/kKp1o7dx9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CxKBAOa/; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CxKBAOa/"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6ee676b4e20so59814297b3.3
        for <asahi@lists.linux.dev>; Tue, 26 Nov 2024 09:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732640469; x=1733245269; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6rC4JORljy68YEdx8irUeLm2zmoqEL3AApISoooOchM=;
        b=CxKBAOa/FZebNSuAXTiwAiWyjHAe/lYmmbT+mHvszkZD8ucQZOhu69F+nnuRlS235z
         hHPCrt9we4hdvcz3VMbBd76lL+Qb5Nw7C5SDRkYt3RHy318emqcO8pz9p9G74mkeI20q
         dFBtBtFjMKOS6tV/SaBXjtOzoehYIEg1r+E+IQwbyyUj8IYVcu8z7SwCP6LvgMECYNKC
         h97FL15PCuGTvVGNwtT/AP/++GXAw7oL/+sB0XUhzjwOh3PvgDDkv+2RePgKFraq/8A8
         nFfDVtAo3OyXGjBFUfvctOMdJ7Zvfn1zeka2WDqiVUiWFCtTJYl2E1bxtXX+aZsT34ZC
         zE9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732640469; x=1733245269;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6rC4JORljy68YEdx8irUeLm2zmoqEL3AApISoooOchM=;
        b=pDovfwHEKXS494EWNOhmIIQAcU0RA4AG7RHv6IjeDhGJxbmPjAyYnX2BwKaIBOnq/z
         pxez8UezDpR459LXlJjrdGqbLnLI2bF+xgOr0RBBXB6KPW9q7JxalTJwq4YWZXYB4luQ
         KCVUVub62NocozMWjevXn7DDdEeCPEc9CkWKcAacRAit1zn1mO++KOTe0TBqoNy9Fp95
         cW9ekPDAyJOHrs1eA/2PklJJK6BYz4zm6gu2rRPB0Vi2rdSI8U9NPDQgw42duYTlD334
         YtwbqoIC5eGRksKrRy5dQk5h4rilY0c+DhHLdRnN3aQjV4MotCncjeaUoXdkm1diERl7
         1hnw==
X-Forwarded-Encrypted: i=1; AJvYcCWeVsvuJKUBzL3/qw+S/55lG+l+tJD92F9qQxxgyPG2amxV1Hj2bD8/dsam76IGFpDED+rD+A==@lists.linux.dev
X-Gm-Message-State: AOJu0YxzakqBL/PfBBKq/creApMUWncR1OMXcd0Bg5iVd63Ssx2xv22u
	zPH3hcWpJhU2bTGVIAxgHPPK8Uh2T/dDvgZx5C56yfmfnn8olsTyYfBHqlqC3kD/VhHLLb9dI+x
	R2e0xamzTIJUsh2tCcoqoupFmMWs=
X-Gm-Gg: ASbGncsdFHGnUolLskbB1jRQiORjnqVXGC8KU+IEAx6mdhdcQVXGaKFxksA51zcwA+W
	i3txas3Z4LWBbVois6XrIY/4S6kTqWdm2
X-Google-Smtp-Source: AGHT+IFd396UsokWwA15Q5p/KFcRLABdHgY43zyTynmP3tmYwQ6jofpQFOVNZv8hTAfYU9pttSvOZX2EXzH2X5cAsqw=
X-Received: by 2002:a05:6902:140b:b0:e35:dede:fe02 with SMTP id
 3f1490d57ef6-e38f8bf5ae0mr16167825276.44.1732640469435; Tue, 26 Nov 2024
 09:01:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241126-adpdrm-v2-0-c90485336c09@gmail.com> <20241126-adpdrm-v2-1-c90485336c09@gmail.com>
 <050d1398-cfc2-4921-b82a-95eecbcddba4@kernel.org>
In-Reply-To: <050d1398-cfc2-4921-b82a-95eecbcddba4@kernel.org>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Tue, 26 Nov 2024 18:00:58 +0100
Message-ID: <CAMT+MTSwCf=iwmD3t=E7T81K_d+o-5XpCxov9fk=_oUnwooA-A@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: display: Add Apple pre-DCP display
 controller bindings
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 26 Nov 2024 at 17:46, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > +allOf:
> > +  - $ref: dsi-controller.yaml#
...
> > +patternProperties:
> > +  "^panel@[0-3]$": true
>
> These look unusual. Is this a DSI controller? If so, then reference
> dsi-controller. See other bindings how this is done.

This is a DSI controller, as referenced above. Those properties are from
dsi-controller.yaml

> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - apple,j293-summit
> > +          - apple,j493-summit
> > +      - const: apple,summit
>
> Summit tells me nothing - no description, title repeats it, so I suggest
> using device specific compatible.

The j293/j493 are the device-specific compatibles, those are chassis names
for the specific laptops the panel is present in.


> No, these cannot be true without definition. Again, please open existing
> bindings and use them as example. You probably miss here some reference,
> but max-brightness for panel is a bit confusing. I asked already and did
> not get answer: isn't this backlight property? What is this device -
> backlight or panel? If panel, then what bus?

Per my response on previous version, it's both, kind of. This is a
self-emissive panel on
a mipi-dsi bus, which can change brightness in response to mipi dcs
backlight commands.
