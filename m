Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089A333E7
	for <asahi@lists.linux.dev>; Wed, 19 Feb 2025 04:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739940458; cv=none; b=PWubvnwx24t5Y/F160gOVvA10Nt9Ey/z6ZyKMUn8oJGp7b12KuhB7bpLzyyp05fuZTES+Le8hRtt4e+YvpYvv7aAsuyg8XbikCBFEs03j7HuASjjQwPXXWor+Kg+MFNgP94Z3xGei7qmQjdFSigx24lZadujAL3HYLcyzw8fmBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739940458; c=relaxed/simple;
	bh=j/FGScFKYIvNF8gNYGwyaBT7JxKCpP+A94CkyRWi/Uk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m5Ro8Y7TWmG92nWIB0gg9yBlCeIOBJURsjBKubuNgHJKycvnNTVi13cf5nVHY7PPfC2pkJXdDeAmw6PI8s6Qe4vLKaAi1VhINbp8NOLA7A1ualj5TwR/aTZGwuiYmTXIkhaS+3gfWoYI3NMh7XhM/u9QKc1DMrIPBzwtz2Nv824=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i5AQx5L4; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i5AQx5L4"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-471d1af90a0so47105201cf.0
        for <asahi@lists.linux.dev>; Tue, 18 Feb 2025 20:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739940456; x=1740545256; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QS3nGYs5YKxyOBVxJ1oYq+XkO0+0BktASGS0GSAFnog=;
        b=i5AQx5L4ezO6KapAcgsDaMEgwG0geDP6+fuot2tYSHFLLv/XKnE/upjwPYrQvBRpwI
         MVb9E+VtVpe1DN37rwiyMqPrB14ITWvfZ4HrOxHn3uhXfjgeY+gg93zFOHiu+i93zGq5
         i0TsiZjgWY6sfFgtpM4DKL65Qlt8BQSnAUSQM1HOTS2mxXfB+5c2At9b1cZd621JVBId
         8LqkXKj8GM8CfYuGKBU0eAw/mNPJ1xGofw/1M88fXWsq6V84B+MXQaRsE6NjhULQ5IP+
         kdBsWeQ/mgY1UhRWDB+pi3CnC3dv0S7Qm50vk2Ai6H8VPKGzVaGyKyDlgCB+pj6Ubfb4
         t/MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739940456; x=1740545256;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QS3nGYs5YKxyOBVxJ1oYq+XkO0+0BktASGS0GSAFnog=;
        b=ZfbVtUtjXAmmp2GhkvTIrgwjfdMsdNuz+DuftIF7gykmYP0kADvdZAULs8wpvShEHv
         Xr8sylIKfD6xFtiKlvkukjdtVg5SEdIHGhPhzpng4yIIiKHEK2xngcFy56iO5k5StWaf
         ki6Cfgm7o348rl0QNl++a4PTjSSEM1gI0N9Bcze3KmB+EPeyDuYR2Tdfe5/929mIMihI
         lri5r+dSb3yOj/Fi/+AR1wceoztniG9WN9C70XTecWa4qu6f5azpXuU6o693uTw3AhYM
         VFU8KCCcx64DdqLv0WLG7tnPLipJHhnv/F0cuTnZVy6g5BuibbeX73LHcWEF/PBGatbD
         OKBw==
X-Forwarded-Encrypted: i=1; AJvYcCU+14+VO38Oa6S1BHGibmlIsanuK6P6zj5cxFRJgAB8Oz1+iEvnOWZxHXWbuSynZnydrj+kxw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxnra9jPCl51RJRPdAV3LZa9ZG6WqjzPKpOI110Ksjiumvwci/K
	4E95d2tqTgmwr8kq4Ab7uBGuzkjuDlMsiO75KBTnuju7V13bXxht0d499g2L0vzwATnv1qkwg7O
	gm41Q3DR3uRnMGoLYXsrFhYie8Hs=
X-Gm-Gg: ASbGncsZ/EoXKND9rVdE3ylhtCCNACbDXwr271WDLH5z+dCNly+r8Y9/Eoj6H9sGP3U
	Ew1s/XiVpUjCPHrpJICOo3xRGn9Nj5fHH6JBBRj2vvd3kGAy+NuOudIUxNZVZBP6+mQmdgLs=
X-Google-Smtp-Source: AGHT+IGrYhj6Gx1SpOFsGXGJgvmhAlAoqQFszNmC5NEGHxmqY4dRbJCZ6QFbIRC7yBQuaRyXOgmzghwDfIcQ4wY8hFA=
X-Received: by 2002:ac8:5e4e:0:b0:471:bd14:a77c with SMTP id
 d75a77b69052e-472082a97c3mr30546691cf.44.1739940455934; Tue, 18 Feb 2025
 20:47:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250218-apple-codec-changes-v2-0-932760fd7e07@gmail.com>
 <20250218-apple-codec-changes-v2-20-932760fd7e07@gmail.com> <Z7SoL3HN7Xb3HUTm@finisterre.sirena.org.uk>
In-Reply-To: <Z7SoL3HN7Xb3HUTm@finisterre.sirena.org.uk>
From: James Calligeros <jcalligeros99@gmail.com>
Date: Wed, 19 Feb 2025 14:47:04 +1000
X-Gm-Features: AWEUYZnqxv5OtWJXczEOpJ1iX6Kd6zGGSMM0m7kJKbH_xe86Di0nRmqCnpc3oHU
Message-ID: <CAHgNfTwmR57GyiMk+-_x3jVNjxCpgLvS4dY2wbZkJN68PgSdjQ@mail.gmail.com>
Subject: Re: [PATCH v2 20/29] ASoC: tas2764: Add SDZ regulator
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

Hi Mark,

On Wed, Feb 19, 2025 at 1:33=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Tue, Feb 18, 2025 at 06:35:54PM +1000, James Calligeros wrote:
>
> > Multiple amps can be connected to the same SDZ GPIO. Using raw GPIOs fo=
r
> > this breaks, as there is no concept of refcounting/sharing. In order to
> > model these platforms, introduce support for an SDZ "regulator". This
> > allows us to represent the SDZ GPIO as a simple regulator-fixed, and
> > then the regulator core takes care of refcounting so that all codecs ar=
e
> > only powered down once all the driver instances are in the suspend
> > state.
>
> I get that the reference counting that the regulator API does is useful
> here but this isn't a regulator so shouldn't be exposed as such,
> particularly since this winds up being visible in the DT ABI.  I
> could've sworn that someone did some helpers for this case but now I go
> looking I can't find them, we certainly don't use any in the regulator
> core.

From what I recall, no attempt at shared GPIO infrastructure has actually
landed. The multiple {de}assertions of SDZ put each chip on the same line
into an unusable state that requires a full power cycle to clear, so
we can't live without
handling the shared GPIO somewhat sensibly.

One alternative off the top of my head is adding a dummy reset controller
to the DTs and integrating it into the ASoC machine driver (which we have
downstream). We could then put the GPIO behind a shared reset line, and hit
that instead of the GPIO. This does seem a little complex/odd, and IIRC we
considered this at some point and decided against it.

Is there any other option that may work here? I'm open to ideas.

Regards,
James
