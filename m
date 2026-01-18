Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA780330D50
	for <asahi@lists.linux.dev>; Sun, 18 Jan 2026 13:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768741281; cv=pass; b=aCM+rHdxgZ6FcHOOyfYFs+kTyBqOZlLtwN1LsrEpAPcEyuHWjKAMQmys75Ytcx6CASMJBIMymhjDCzrTctr/KEEzuDM0cH82xRJKR6dHdzIqhrhbnV5+QugAJrBTCFjWE9LTuv+Yf1iT90FghTKfFaf13zsmBlKse3c+/hdMi1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768741281; c=relaxed/simple;
	bh=+01Cb3mcBpAIzGPDMv16TQTn/jHLAQ/E9dNDT0sGHCY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aFmTGeAPfrqfiNrv4QjIkT2y2rVTfxtWP24iruVZKIXmIKyj1+wAEuefvzqnJ5CpzM5Rj38mHFzLJZybZTNgy0sfTNoC8jVI5TBwSFdiQHbL5TTaoRj0pPY3/UXB+xIscku2PbEavaxa3Z+47QMH/+PJE7TltL2OORqsEETfvI0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wnlr8ofd; arc=pass smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wnlr8ofd"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-792815157f3so32940027b3.1
        for <asahi@lists.linux.dev>; Sun, 18 Jan 2026 05:01:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768741278; cv=none;
        d=google.com; s=arc-20240605;
        b=CRkh3RlsPmaSGWPYin8IAKRMkMfU5/CcEokdGxQHyw9ZF+XCnr3ga/GqfeKAeVNJpg
         irE7tOcuGfILbym1rZJ22ii7ezqUwoXmnDxSsJFJ7xZMtZixe9Wi64cpfDGN3t6x+hN0
         iis+1GBqxD6RinYFisS7i7TpA29uMizCtR7dzTkZPoBQghtK9BCRc1KjMEqDhpgQCCqN
         7j6I+pQWihb2HtjE70n6cPc8REKZ1a+vgQAPj8J8Cx8VACKaqBwnlIXL/f14dOgtBAX+
         eJSnmzmOG3BdVVar00hrt9glxeV8rpcNOM6vFdRThjdobRn7EIHMNkV8if70QY0OaO0f
         v5CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/HcqovNmS0C1WNUKztsxWUJLDiXtrL2QTXBBC/kxEI4=;
        fh=NzB2AgdRZ8KFGwXT923FUjlqskRvZtQsSHs0lPO3fqM=;
        b=XX+fENsPI1kWvPp5lHEy7GwhXDU3XEQ2wEvr07lnbXWpxk7YXWQisgP+3OSFi8nKF2
         zV5HRuKL1uZ5ViOjiove0x3x8h+Xai4e+Q9gLJUeBA/dsDgFvY368JQcZI5sS5SnsAY3
         7P+vw52J+CptkOx2P7SjlumaxtgceQIrRE+wOR27EAaT/gvdBrDkOn70+fxHJdr3QJSk
         FVCR6bb5gpo+qGAkFPxeOe03h8OA8CuhNnkAJDQlb7V+02B4bsYwm8pmaSQfjSRod7+r
         z9eajWVCkbBsK5ZOitKHOnI0EmPo2Z3JSZYLzCo4BUae84umUgGLsLgHYNHl/So/qeIs
         rNGg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768741278; x=1769346078; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/HcqovNmS0C1WNUKztsxWUJLDiXtrL2QTXBBC/kxEI4=;
        b=Wnlr8ofd/8x21K1+xlAX577fnG8h/vJRLq7wP+tv26e65nzRWx2VIDdQbxpQDO0rKj
         SLJYjHo+Ll2mxCj5tSmpDNV+YeTM0KFlZ9u4mC/sWW29lZf0ggNyHjMHkzr+/gDtiXNw
         IenNIHJ/MqePyGGoHcKq9Ham+kiY/GK3kgu6HvBCwisk93R0xRA7H+FkChdFhPaFaaxr
         ilgpQdcci+aqAkdWk+rzMPIX3qybSWG+O9jZ/7p/MP8nzQohPs+EyAUxeTW+qM3139km
         tytwfq5ZC+pUSp21mQPkuzqQAFkqQUOP03BrRgvZwhR4mHuHlVwhBaGc3cgc9pAqQtJy
         zqSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768741278; x=1769346078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/HcqovNmS0C1WNUKztsxWUJLDiXtrL2QTXBBC/kxEI4=;
        b=oX98T8Ys9Tboul8uCdN/1QRj0qR211z9b/aybG+4G2g3kTK/JPUIO/dq/VtP5cTwGo
         ZxadSvHLNzY7QyGVIjqpb5Bf/x31+tqb39m94FfWv0KiuCMtdSbRMAdCe044gQ5JzpT0
         s/IkBPrekQ7wernJMzuGlCA583RsBaqUYHU2bGkeK7lRgpcEevEe6HYbiL4YNaot39RJ
         1+amZlN+15fguSc34wAmcOTrIqLfi+TFXfyzEGWEfTDtLN2VK2EPg5obgov9Y/YqT1Mp
         lSdum1wYN5o4GvCV+m6byy02s6Z6h6AQznTC1/Anb0As4BdXJ/REqjgG+OtGpm453shX
         +zMA==
X-Forwarded-Encrypted: i=1; AJvYcCXvYHya7X1L8Qt8te2AdBeVoLEWZlPY19RC+q2kB1h5hdO/oKY+XPxQe85IEiP5KRmIFhvtZQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzAvT826dQDT64FwfDiJ9nKpYD7CS4TCYATmP75QoUrX/rpULJj
	fiHS/SOZlcgLM2PNhM8P691D8xFEsUEV/0un3wDYkT9Bq24g74mkcGdmWxwz1bc53L+zvRu8/Ut
	gv5xDaIitt6iJ4IbYFLox+nmrGz1d03M=
X-Gm-Gg: AY/fxX4bevxAOiTBNOoOiKoJp+h159PVLjXTVjuAvdX61V41vyaL/q7erOkK3kSbWIj
	B6TU1BNUxygxSova05EyMJwDsLEwzcmpaS6Ox9jW/vEVV2OgD7F7JUFHD0DuyuvI5Mjczj9zIvJ
	D+jKCHPjuXpsT3Cp6+CNkmI7ZYXRGvv6qcGhA0wRM4X5S8W0uBKqgmPdipppHujp4Ml694I3DkM
	pxBexH2OdYhpdKxxW5zYlAjCUdp7RKY+0AqGPHhcx1qQ8/qbPKLpOZoITkbhV6YorlCuNNyCGy/
	uUcGwQo5TOZhQHRFSEgMPA/WT/Nj
X-Received: by 2002:a05:690c:9c0b:b0:793:b353:9dd7 with SMTP id
 00721157ae682-793c683524bmr71951307b3.53.1768741274889; Sun, 18 Jan 2026
 05:01:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260115-b4-macsmc-power-v3-0-c236e09874be@gmail.com>
 <20260115-b4-macsmc-power-v3-2-c236e09874be@gmail.com> <20260117123247.GB58217@robin.jannau.net>
In-Reply-To: <20260117123247.GB58217@robin.jannau.net>
From: Michael Reeves <michael.reeves077@gmail.com>
Date: Mon, 19 Jan 2026 00:01:03 +1100
X-Gm-Features: AZwV_Qg0kRBEifh1Sp_fpTXxWriqblhk8t3g8YtA9hXlnvyNjUGbX9JPXHLuelA
Message-ID: <CANpmGNuZjYVEu-0mGezuy0mLpnu9Cg1aBooJV=hAr+-BJW0yiw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] mfd: macsmc: Wire up Apple SMC power driver
To: Janne Grunau <j@jannau.net>
Cc: Sebastian Reichel <sre@kernel.org>, Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
	Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Hector Martin <marcan@marcan.st>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Janne,

Thank you again for your feedback!

On Sat, Jan 17, 2026 at 11:32=E2=80=AFPM Janne Grunau <j@jannau.net> wrote:
>
> On Thu, Jan 15, 2026 at 06:08:16PM +1100, Michael Reeves via B4 Relay wro=
te:
> > From: Michael Reeves <michael.reeves077@gmail.com>
> >
> > Add the cell for the macsmc-power driver so it is probed by the
> > MFD core.
> >
> > Co-developed-by: Hector Martin <marcan@marcan.st>
> > Signed-off-by: Hector Martin <marcan@marcan.st>
>
> Co-developed-by: for a single line change as simple as this is silly.
> Please just keep Hector as author and just add your SOB
>
Will fix in v4, thanks for pointing it out!
> > Reviewed-by: Neal Gompa <neal@gompa.dev>
> > Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
> > ---
> >  drivers/mfd/macsmc.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
> > index 1b7e7b3e785f..358feec2d088 100644
> > --- a/drivers/mfd/macsmc.c
> > +++ b/drivers/mfd/macsmc.c
> > @@ -46,6 +46,7 @@
> >
> >  static const struct mfd_cell apple_smc_devs[] =3D {
> >       MFD_CELL_NAME("macsmc-input"),
> > +     MFD_CELL_NAME("macsmc-power"),
> >       MFD_CELL_OF("macsmc-gpio", NULL, NULL, 0, 0, "apple,smc-gpio"),
> >       MFD_CELL_OF("macsmc-hwmon", NULL, NULL, 0, 0, "apple,smc-hwmon"),
> >       MFD_CELL_OF("macsmc-reboot", NULL, NULL, 0, 0, "apple,smc-reboot"=
),
>
> This patch does not apply on top of v6.19-rc1. The base-commit helpfully
> provided by b4 does not exists in my tree. I assume it's either a mfd or
> linux-next commit? Please note the branch/tag this series applies to in
> the cover letter if it is not the most recent -rc1 from Linus
>
It's based on-top of the latest linux-next, I will mention this in the
cover letter
body for v4 (i only put it in 'Changes in v3' for this one), thank you for =
the
pickup!
> Janne

Thank you again!

Best regards,
Michael
