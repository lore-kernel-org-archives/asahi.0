Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF2631076B
	for <asahi@lists.linux.dev>; Sun, 18 Jan 2026 12:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768740840; cv=none; b=Bs730YyYW0+aDpi0h8kSvh0KN6wWa16ENXDt4NhRhpAnsjj80lLEOE46RhERgByEFT/mhga3CYJgpLS25DkQAQK336XuZ1mc3KAwtbd3O78cihTYOqpJtbOpaQ0Ay3s/OkteNXUJW7qNzMJf8mHPZjsCEvyZQnFUeDj9ccKqW/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768740840; c=relaxed/simple;
	bh=X6VRPWR3+I/is3qO7tMIcC/t18XZn9Gh0EvY+axJ2d4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nTq15pTXEOTtNAKpkSAD+sUq4M+pHnT6/heNYqADnM1/MTxdI/VWsy1WiUYyTvx4TMUwctMMyh3YbQxjRpnNFoCYWcYHz9JDCKI8yMxS87vIsFJ1BtqSxXgOmj7xL48/00UfYR9O6Yl3vaRLfv7XYHnomNd721RLYadHjXIVeyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UUwxVLuf; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UUwxVLuf"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-78fb7704cb4so28806257b3.3
        for <asahi@lists.linux.dev>; Sun, 18 Jan 2026 04:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768740835; x=1769345635; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nq0ZedcEuNO+ABzh265FROMeuNw22COMEoNCyWJq1yQ=;
        b=UUwxVLufPtkXLhkel4NQTYKCR5CmwPwwiMY4/91zGlpm1vnOmhIS0cVnrC1oj47M9M
         ZvDwpqHdnJni9f0ZosqqmmDGcTIgNPShzC3SdkxvYukXB/8E73ml6A61bmAxd3wrT+iR
         jtYMa3nUle6E/p140KqP19rv3p/kmUTrC5MALOdhstGe9k+NwuODj+fAYRiE3hSrLtyl
         8D42akQGqmY7syDoF+1hLLKtTCEh6aCdZRDrd+VS887ZHhNXxV4IdU67HjhtkK+LAPl4
         vqG0DQ+Kz8LCzN1+HjjYNXhaxWfhD8grlSG4PRuJgvxOC4ErOgDf5B6tKSmAmRVLoNVU
         bL9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768740835; x=1769345635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Nq0ZedcEuNO+ABzh265FROMeuNw22COMEoNCyWJq1yQ=;
        b=rhRJfts3gU6uHpP9f4QD8u/mYI/qBqp766EcYtuUQOXsPpe93i8WF3QZtl3lKILc5t
         MlydcifPYjGcRD3I8d2of8mK441p2Ii6Ufifffvpg+HFcl/d+mhmoPi1PPpx6t6MxYOv
         wl9hrTuhx8VxFZqdUONhkYwEKXQ4+69Hx8uZCduNPd9yVa7dctsuSpC+QADL9LDDe5qs
         K8X/Mt+Q824/XgjppgH9w2hTP8ucJOqTRH/5qrrn8JAE8XLw/EtnvZu0qptH+snJOpfb
         rmt8VV6l1oKiZt6wWi5hsdXQunaRrNxMTPjNkUQSIEugkQCzibtCD7hLmQSELsK8rd+d
         qwvQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2Sod5xt91ucOjWJSvvFGjzL4eITg83B/fvnPyN3v9jZlwyzPU8/qGpem3JUyzFHVFTIaaHA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxEiH3/bIob5kkHIZX1LwDdm9NIXFh36PdWbtUcVrRIBeZC93Oj
	eBl5sAiZpTuJESj4y8Ji+hkQemSi3vdau8ZYJ2CaTaxEZozvXLFFiGrBvQ8MugRI6/AtwPoSnWR
	Ev+kjdfcqT+GT6NBOqvSCpDoZjZCCqVU=
X-Gm-Gg: AY/fxX4t22OvpKfgq4yNwdcgk7iVxmTDJKsT/ruRwLDzFJO2Z6i48AROWNf0fAX509l
	4WDaagynJPxiGiAUtdhmLOJHx5CNkJXqAUQ9YfNq8fm8w7tGgK3ZdqgFNw2lXEWqkJysE0At903
	ePCofyMegsh1qhi9rgWBZwMt/VyXWlDcXtZXYEN3Cv368peur49SrbeR2QOdNheY+9EPa4mwosv
	dH1+JaxXLtkEO1YjfwXuGnsINV6x9FuRkEqsd47bfvjii1J/BkLUCTaVCHpcSzkQWWMYOeJdV7M
	p6k3UmcFil8fuyTCtg4IY0gGY/KG64RIFLJwW6o=
X-Received: by 2002:a05:690c:6:b0:783:7143:d825 with SMTP id
 00721157ae682-793c671d3eamr65122677b3.25.1768740835221; Sun, 18 Jan 2026
 04:53:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260115-b4-macsmc-power-v3-0-c236e09874be@gmail.com>
 <20260115-b4-macsmc-power-v3-1-c236e09874be@gmail.com> <af3204c0-0492-4555-9a75-3716fa264ecd@kernel.org>
In-Reply-To: <af3204c0-0492-4555-9a75-3716fa264ecd@kernel.org>
From: Michael Reeves <michael.reeves077@gmail.com>
Date: Sun, 18 Jan 2026 23:53:44 +1100
X-Gm-Features: AZwV_QgnfqxKHc96qGbQRwH3BPdaA4uu6Z9QA2PDHlHd4joF1Pds45iGW_-m9gU
Message-ID: <CANpmGNvNe-Y7mgMEqKYGvyA-v6pKLc_9NZ8LBLuy7__F+k4oGg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] power: supply: Add macsmc-power driver for Apple Silicon
To: Sven Peter <sven@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Hector Martin <marcan@marcan.st>, Lee Jones <lee@kernel.org>, Neal Gompa <neal@gompa.dev>, 
	Janne Grunau <j@jannau.net>, Sebastian Reichel <sre@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sven,

Thank you so much for looking into this!

On Fri, Jan 16, 2026 at 8:00=E2=80=AFAM Sven Peter <sven@kernel.org> wrote:
[...]
> > +
> > +static int macsmc_power_event(struct notifier_block *nb, unsigned long=
 event, void *data)
> > +{
> > +     struct macsmc_power *power =3D container_of(nb, struct macsmc_pow=
er, nb);
> > +
> > +     /*
> > +      * SMC Event IDs are reverse-engineered.
>
> Any chance you meant something else here? The event IDs aren't special,
> everything here is reverse-engineered ;)
I was more meaning that they are made by correlating when certain
event IDs appear,
so the comments I've added aren't 100% certain as what Apple intended
for each ID,
(unlike keys where we can be more certain because they report a
physical value).
I guess that wasn't the best choice of words as everything is RE'ed,
as you've said.
In v4 I'll make this clearer, thank you for the pickup.

Best regards,
Michael
