Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507E3149C41
	for <asahi@lists.linux.dev>; Tue, 22 Oct 2024 07:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729581253; cv=none; b=YykFXMuwJ+62csIEX0b3Ij7x06w4fL18TDf6cUWy3Te1VKtd5M1UgWGpLfBaKj0dkdNLiKKbQfqP2Jfn+5TKqR9GFJD8oxqFNf0hzOOc5UTFBi8DQgpRlRuUKfB+O8bjTMA9CJaetdEcOOf+39MyzouyhRC/06NiKqZ4ul3XK5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729581253; c=relaxed/simple;
	bh=FaTJrnKvTNc+V3dbBhAL3Glgo+sHMhxk4md12E05/ng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XkBhBWYj50JepntslHMgA5l2eTq5ng49D8paNc2JhgfZVmBTMh/he/RSb/Q3i7O3l/URUGvxx+oapwwGVYUDfW6J15WJvsCQ7/26ZhrJvai0lRJ/wLXkZs8HufTYsZ9US0ir5APz3ZNljJ7iyscWf7H2siRs3vVm5mcag1z2CI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AG+sHJ3u; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AG+sHJ3u"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7db90a28cf6so4119425a12.0
        for <asahi@lists.linux.dev>; Tue, 22 Oct 2024 00:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729581251; x=1730186051; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FaTJrnKvTNc+V3dbBhAL3Glgo+sHMhxk4md12E05/ng=;
        b=AG+sHJ3uNSuaEBOxGCu3bzYOLiLOhEjTBRtNXlk8s1VUhp4oxMxD9/6qe2/vhfh9i+
         UZd7U1m/mA/biMYztFSId868dJTDHhzNYf4cis7ZKNv7Jrgy8D2xXJ+JMdkbOia9jAHV
         LiPCHJsggaiLswvdwuPKfe8mH9GlM5PenQa68lWjdNuryFvLTH6s+bwfXABjTKAPpL4a
         Kt5cGIP+VY/KPnyUSWfewSpPZFBZ2FuiRL19Ni1D9STWsX+NHpEB2HGbabpeOcxNEHpS
         iC4yZwxSrtmryWquLLFFLlIgYLuRCO9+lUrhblnQXz4PnHjXqoYqnIPA/1bkac3IgAXc
         tGUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729581251; x=1730186051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FaTJrnKvTNc+V3dbBhAL3Glgo+sHMhxk4md12E05/ng=;
        b=rK6DpB1QRdQITBucS7dZg2GcMnak3mrjJO8mp474u/XsGu8zvG80/OLbL20PrJBWd1
         YG0pTfKA1FUIoO43VTpOsHQPOr5i/hHjQCdanidhjfwXvAC7ng+occv05dQVQh8ytlne
         difaOFjr/sMwJqOobEvQNbqxRaIFiMz/KfIWsdSto+3rNeASk9KcM1/mXGfdBnNsCuYY
         zUjDO6aBoIg8nJzQmtSNtQfWKqrfDmZLyYApgr6f+sPgwYeBoA++LxWiOMmec/dPa7wG
         DVjnQ0Qd2WmxVtoeX35JvuhZH0W6/dgsyrgtBzVKrMTL4u4CN+civxfyNoQsZA7O8OZu
         NAUA==
X-Forwarded-Encrypted: i=1; AJvYcCWpqFTWpHuBwpEio4E8VqpnzvJAOi0xabj7O5kulHWoplfYKZpqpLG1vwyWRCt05vHyne2N9w==@lists.linux.dev
X-Gm-Message-State: AOJu0YzZE7OTN9jqx4WOwthcDB2hIa9+Jv4a/J6H+lc4FtbBkTzqL1Rl
	yGvNGbIZbTVeo65rbrCj633rWfdtfvku1UjUwgLtOdFxT9i53VS9
X-Google-Smtp-Source: AGHT+IFpezyYg40TMB0QgVk9F9LufBMXE2hWRts318j7F5wsWf804p9uSDbl2tZNPQIm+93G+p4R+g==
X-Received: by 2002:a05:6a20:e347:b0:1d9:3acf:8bdd with SMTP id adf61e73a8af0-1d96c40ecf7mr3433222637.22.1729581251406;
        Tue, 22 Oct 2024 00:14:11 -0700 (PDT)
Received: from setsuna.localnet (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec132ffb8sm4082732b3a.50.2024.10.22.00.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 00:14:11 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
To: Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>,
 Neal Gompa <neal@gompa.dev>
Cc: Martin =?UTF-8?B?UG92acWhZXI=?= <povik+lin@cutebit.org>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 asahi@lists.linux.dev, linux-sound@vger.kernel.org,
 patches@opensource.cirrus.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH v2 1/3] dt-bindings: sound: Add CS42L84 codec
Date: Tue, 22 Oct 2024 17:14:03 +1000
Message-ID: <10547772.nUPlyArG6x@setsuna>
In-Reply-To: <e1d35dc6-4c58-490a-87d3-1e9694b3c650@sirena.org.uk>
References:
 <20241020-cs42l84-v2-0-37ba2b6721d9@gmail.com>
 <20241021192632.GA965116-robh@kernel.org>
 <e1d35dc6-4c58-490a-87d3-1e9694b3c650@sirena.org.uk>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi all,

On Mon, Oct 21, 2024 at 02:26:32PM -0500, Rob Herring wrote:
> On Sun, Oct 20, 2024 at 12:47:31AM +1000, James Calligeros wrote:
> > CS42L84 is a headphone jack codec made by Cirrus Logic and seen in Apple
> > computer models starting with 2021 Macbook Pros. It is not a publicly
> > documented part. To a degree the part is similar to the public CS42L42.
> > (The L84 superseded L83 seen in earlier Apple models, and the L83 was
> > pretty much the same as L42.)
>=20
> Why can't this be added to
> Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml?
>=20
> I guess perhaps you don't know what the supplies look like? Do any of
> the custom properties apply?

I suppose the original thinking around creating a new binding was simply ne=
w=20
driver, new chip, new binding. We also don't describe the power supply of t=
he=20
chip at all, as this is all handled by lower level firmware.

Some of the custom properties (e.g. tip sense debounce) should technically=
=20
work if we teach the driver how to set them at probe time, however given th=
at=20
the chip is almost certainly never going to be used outside of the Apple=20
Silicon context we went with static values that were first observed under m=
acOS=20
and then optimised once we had enough of a working stack to play around in=
=20
Linux. The values that go into the registers for each property appear to be=
=20
identical to CS42L42, so it should be possible to implement at least some o=
f=20
these properties if that is what is preferred.

On Tuesday 22 October 2024 8:15:50=E2=80=AFAM AEST Mark Brown wrote:
> I don't know if the Cirrus people who are listed as maintainers of that
> binding might have concerns about doing things that acknowledge this
> particular part.

I suspect, based on the past behaviour of Apple vendors including Cirrus=20
themselves, that they either won't or can't publicly acknowledge the existe=
nce=20
of this chip. Given this, and the fact that the chip will almost certainly=
=20
never be used on any other platform, it is probably better for everyone=20
involved if we cut them out of the loop.

Regards,
James


