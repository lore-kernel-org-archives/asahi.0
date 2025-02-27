Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F207A26E968
	for <asahi@lists.linux.dev>; Thu, 27 Feb 2025 21:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740693534; cv=none; b=T6Fwrp1vlOmHr22UH720MnKl1p+KfkQ19g9HGca+JyiPleYcKk0B2mEZUKkN2+J0++GI9dCqJe0/TQvenV/BEB03epM+LtwiMPCTR0FmCN5INw4zzY7Nn4DEs6FMt6rpsUwftavQ+I1MR7qWhFi1nnnwpBCTNtZeuEeuIbPsrvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740693534; c=relaxed/simple;
	bh=Dm3RxaB0CXAQe1z7lgXkILph+xq5j+lovtkROFEkZdE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XHivdrWziKojtDiIPYEMmNlhpW1jMs6i1mBdMSv0+q89bzV7ewuoFcA5jCNL/yUGp5tX3gUaQbyxZ4KYX3dIEwuttDC9odt+z0toXTEJ96YOIO05Xjg6MnQjj5j//oEEc1BIUjvmj4mfAw5dJZGQpi3t5hltd92FjID6eunV3nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=keNiisiU; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="keNiisiU"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-472180fec01so15284751cf.0
        for <asahi@lists.linux.dev>; Thu, 27 Feb 2025 13:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740693532; x=1741298332; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dm3RxaB0CXAQe1z7lgXkILph+xq5j+lovtkROFEkZdE=;
        b=keNiisiUn72n5vRtjxfhparT1VM4ne6KdUZF5tuA9RAuKTvf+mB4CDv5zPXNhri10S
         58evzPiIHay5jEwcfKlHW4tfCQV6lW7TQ86L0A29qky/ZkLtbaOWrZSJNX4T6/2CtE43
         rJbG/jzfB3hBrl1WvViQEBJKsHoF5/rw2jJy0zcwUTmIl3oYN+DuWT/sjM4dNBMkuAay
         m1nSHTJy+1H1YhrSn7OeZeMjS4F7PJXTcKLcmT6NDwPxC+UHcyHnvtAJvvW49mkVZfW0
         VsDjxT7AdR4JwZyfoxTwjOLBcWziQWQM1ZP4j6msDkK2vMs10xWeGskMvU9+p0YqKX7m
         IXLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740693532; x=1741298332;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dm3RxaB0CXAQe1z7lgXkILph+xq5j+lovtkROFEkZdE=;
        b=SjHYtBSSbWjA1Xdxs+IgtTBEbBQkTv5Ld3Av0qAlMCJgnN+WeGUrJyIksL0jKtPAEy
         fBLbdzzeKFKrdmy+sFcB+fonBrTVC4C1l6iuR81+TB1J+TpDhHQExczfvicmkJDdhkwp
         pHFjnHNZx7nxwODgtvPpuD5pQsxUyHlk5V7udByARkBQHPZJLdCdSZq93K0SdDgPxv3u
         LGj49j1BAmlvizVLF8IY1/UdwnCt002uFe0ZeLL4ItOQUfjZyi7URZpYnU3H+k7UkzxF
         CWtRUFfX4aFn81rsvCtwHZKWi5nQCEd/ZLrzisAqLKFgdMXQfT3b468kJhUfkFO5Hhlh
         3AJg==
X-Forwarded-Encrypted: i=1; AJvYcCXjy3+GLrOLpccAvB4BCQ6kCQvrqKA6+uu903ElcCvPHDinrrIL8Azl6Y63pN+aDkgHEs8ZYg==@lists.linux.dev
X-Gm-Message-State: AOJu0YypcafCI4p/26II1yRCfNIFS7yuJPQvBVj/IiR97sJ8t684qP7R
	s9rv1T5eu1CDv2M+bMo2U6gB7mf9xgZyd+8gOGMTlx4HOpOxcVpH5LGlHZzKonHj4saLvNd2qa5
	BPjYYTFYa64qCjGfqvy1lmqEzYr8=
X-Gm-Gg: ASbGncvQBeHoKRfYQoHsTMt4DENXu3+RONkrmBT8VSxLF2CtJ67nFG40OBO6v+Q7C3J
	PyUjuhS80TzkRw4+9uVhruvk/CiVfbxjrnruaUwXtnox7oCcJeFB+mAdw8u9BLlbddLOnl4naTy
	1E5fR/xQ==
X-Google-Smtp-Source: AGHT+IGZycxF9mK2j7Xgw/jf4P4PzwJkPkA+YQ8gNsvWst/YlqRF9ahH2kcIfaFTwicW7dgH/uB2VhA7H7UVn8sEOSQ=
X-Received: by 2002:ac8:5ad0:0:b0:473:87fb:2ecf with SMTP id
 d75a77b69052e-474bc068615mr12002921cf.21.1740693531852; Thu, 27 Feb 2025
 13:58:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250227-apple-codec-changes-v3-0-cbb130030acf@gmail.com>
 <20250227-apple-codec-changes-v3-15-cbb130030acf@gmail.com> <f3eecce4-51d1-4414-af85-680d51e588fa@sirena.org.uk>
In-Reply-To: <f3eecce4-51d1-4414-af85-680d51e588fa@sirena.org.uk>
From: James Calligeros <jcalligeros99@gmail.com>
Date: Fri, 28 Feb 2025 07:58:33 +1000
X-Gm-Features: AQ5f1JqhIE5frhKKp88Yce4HcYqH0rbyxjCTlt3Y9iZPbu-hf4o4-EBYqcvAUCc
Message-ID: <CAHgNfTx_kMj=rsd4nUCiX_PvgC4GX3DsPDwXHdEyEeLMbDFccw@mail.gmail.com>
Subject: Re: [PATCH v3 15/20] ASoC: tas2764: Enable main IRQs
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Dan Murphy <dmurphy@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shi Fu <shifu0704@thundersoft.com>, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	=?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
	Hector Martin <marcan@marcan.st>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	asahi@lists.linux.dev, linux-hwmon@vger.kernel.org, 
	Neal Gompa <neal@gompa.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2025 at 2:23=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Thu, Feb 27, 2025 at 10:07:42PM +1000, James Calligeros wrote:
> > From: Hector Martin <marcan@marcan.st>
> >
> > IRQ handling was added in commit dae191fb957f ("ASoC: tas2764: Add IRQ
> > handling") however that same commit masks all interrupts coming from
> > the chip. Unmask the "main" interrupts so that we can see and
> > deal with a number of errors including clock, voltage, and current.
>
> Shouldn't this also be a fix?

I don't think so. The referenced commit only says that it adds an IRQ handl=
er.
I don't think this commit is actually "fixing" anything - it's just
enabling previously
masked interrupts.

Happy to move things around if you disagree.

James
