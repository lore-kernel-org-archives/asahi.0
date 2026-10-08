Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F8446EC77
	for <asahi@lists.linux.dev>; Thu,  8 Oct 2026 08:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791449212; cv=pass; b=ZcDOfmIcmv8rki/vuaUUJmbQMW03WvS3xd74E4qE3SM25chCkJqfqPM1qJjc2rxIyXhcs6mcXv92a8pHP2Am8enSkywv0P2qnhdLT3M+U1uVx2fcfoq2MUUMwzgqlVoDpEeth11xWY5BZo5EOzcLb7QgOr7Bu9S2tzWVQa30zOk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791449212; c=relaxed/simple;
	bh=wnGY+XHH6HDJ4wz0G2ps9VHtwY0746+c1EU1QVcGcMM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qx/GIlydGT0/s2l/Iuq0LV4digk+7HnE8KWsVfF4Au4NjCqHba/4vKEymC4NfeUOOUgQsS7nIl0dHV+Y89xxymnPjQxhhBOqThNEuo0G/eHcAlrniM4PqCAZ8JHhssEZfZGL9EuPVI6OR7CfjyTtb63QVoBH64giYOTdy7f8Wqo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VKDU5dRa; arc=pass smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VKDU5dRa"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-823b938464fso3819672a34.2
        for <asahi@lists.linux.dev>; Thu, 08 Oct 2026 01:46:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791449209; cv=none;
        d=google.com; s=arc-20260327;
        b=jEzWHUVEXWMcChfVDZtBwA73UxM4sC5vueu4BguTesGZ2aJ0lQ8uEXJA2+0jZJ6fO+
         ybhXyIFjvRBcrXv7rYEu//fgsOArbi8gMrHTrRAOASXC26kw2JKMWEUi4Tcu8aWh7ND5
         SEvEVs/jwIEf97efWZal2zbhJgSem3blOB+1PFtfYCqRMHzKvxAdBrTTNryCKGbGiRNT
         1RsVIprYGtKi9Ukbp7yZ0+qj36QALYYsgoa0EagA7kXo0RMiIRarlrWS0/sGVgUJYaj+
         7PvOYBIsns11/uUsgY19VGaqXhW+8LhpZ2WX+4E5i9Wq8d/jzo/nzUgWVNxsxHlPpKrF
         QDtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fhGDVCOgQLncQuplToj/mW7JvsPvLFBB1CNf9MUb7AU=;
        fh=L2LQf3jiNf7D2MSuZvhfakiXqGIgdJg7fAOozKYDq/c=;
        b=AwH2JeQGTtiKTFmaEUzPwspsIeSFqG7W3o4yUD34IW1AIQBkhk2Fq/chsCmJfX3Koi
         m50mV8smQ1Y7IKIUkrSt/F5i1/aVtjwn4w1vHxOM1GSqmr43WsHjL6Wtz2Or6azIt/bG
         vQeKiJP0mp0SJicJ5pnqys6bn7n6NZcp1hx5lLmRQMbltxCEwYPdrpGP8deh+q9i7vFN
         jpFusdDLoq/1KhB5WVRg14bdrePG3xIx/SJRqvQlY4mjcabvJevdFBvfAfRj10fjvJwE
         zFUVjxccKfS5ij5JCkJNQPhrqf+NY8hRHuez+ZPztOawfLSdNVQpO5Awz63ro0Tuwt52
         g/GQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791449209; x=1792054009; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fhGDVCOgQLncQuplToj/mW7JvsPvLFBB1CNf9MUb7AU=;
        b=VKDU5dRamP+2gZ33FPf+HcZwzYw7AMhYLZNFiG22ocesi2DNGLYqT3dSANgcEvuUnf
         sfVdc0UobZipwbmCrT+YeMtzaI2gmPsmydGkfhWnGzzXDAhoxoM/lHP/UTzdK06Q6Mgy
         d45jbLoYoBqrvSo9OT/9v+G1XXHu47Ylqo4vJnd6XhgCr4i/MosXnXCmfcngJnQKl3uK
         qDOGW7woQeGNvmV5wryIYLKcUov2c6nQ5a2Z+JHlnMMwOs9Uhy3C9nqVflMcvzPcOxQR
         tcs16QJR+9a0xR+HKZjrN3LIZNxJWV1v7nIJYD/0tSB9b7LooEyNxwg0kVc4PTaa8pCY
         h7iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791449209; x=1792054009;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fhGDVCOgQLncQuplToj/mW7JvsPvLFBB1CNf9MUb7AU=;
        b=xr/Pbcc/WjFPtNZihgI98ffFUYs/JU70KFz0rHTe43g+Ia9+E2+xAsRJnKoFEte2DD
         4Ae6E/13VbHEhEQKPPUtjMg3e25VhbKxF+luzxNkhaSBsJ31g4CoZNiO0qRDbzIN5uUG
         0oVlgmO6S28iZ8SNyo+wWGecu3o3nhei9gF2roGNYUAw7tVkGPFsch+rJc+7k2UzNf8g
         deq6zGeYjoecz0qGuKEgUPmyHSJyS71CDPOY7PWs+by8DW9sWRpo/UMM7McZ5eWj7J51
         sg+vgj+X8/fkw1UJx5gxkJX/EHi4H5y+a7/1G9YqyEPA27IoBS5HjSeIHX4BSNBWY0E6
         uiNQ==
X-Forwarded-Encrypted: i=1; AKwUvBxDBxBkyTlfY5WXwYQB4enELiG6YqmB4XzNm6Q/1X389rQj6+QEkunsR7QdGcLqw9+NK7br8w==@lists.linux.dev
X-Gm-Message-State: AFuF++nqnYVjM5RoLnV8Nw9liFldWzD4JXmLsjlgDwyxBfqthKdn0MVR
	hAgSd8mRFt1iVHds3iHULMzgyPp9lmkR2bjvILOEGeD/dUQZlWZ+29R9XvvcovDomXvXK4C2O05
	e5Q8E9LEXzHVMI7tYzbqOlnVGSxUoeNo=
X-Gm-Gg: AYBFou3VPh92mEErrQUTy/kdp8pQtyDrhETkDonm2VZ1zPtHv6zxx0F553d8zf29mwd
	k1DhVdkaJV3JYTZ3Q9beutQFnfxdyc0qwgp1or/cQfPOhStKJF5zd1boVWei7u86eDweSaPd2iz
	mv0tYbpPjWtPaCJQCnRyfVqzYVfpk4Bw3cSYIO9OnBRvUHGhGEBMrxSZ7iWQxlDo6XpIvgDDjl/
	zu+uR2hyKeqjs0NNEGVEslQvlkfTmOFPfI9i+viDdpMNn5kPxzS8jjUM82m7shT1utqvWgSm3aD
	RxfFcSx24sc/nTdbMWRteAddcC3YRgC2pezlzYRIkswjAW/3a732hAQOGhmxCwVY7IsruFfi3H8
	upHEGpMe+zwNop4YA4SLVj/r1omMY8eJyMFa6xpMMyaOnG38hYIl/1TY7i3qFr8WYSYvIIFriEY
	eVoTlSpAgmC1m7o2sP0TBtGaGF44bSZ7ROEAifpJlyLcgHfE5L5fE=
X-Received: by 2002:a05:6808:2e43:b0:4f3:36ff:e521 with SMTP id
 5614622812f47-4fc46c92bc4mr4767586b6e.58.1791449209535; Thu, 08 Oct 2026
 01:46:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-11-7b47ed6335a8@gmail.com> <31d91f44-3f16-4a4c-916c-f4d8107d371e@oss.qualcomm.com>
In-Reply-To: <31d91f44-3f16-4a4c-916c-f4d8107d371e@oss.qualcomm.com>
From: James Calligeros <jcalligeros99@gmail.com>
Date: Thu, 8 Oct 2026 18:46:37 +1000
X-Gm-Features: AclHuK9CHquST79ZWASmiEF-eCVAGlz1SqIt2DEtZen9lPzYSl_ASrQBijUe-o4
Message-ID: <CAHgNfTy-h8m-XBBzW6jSNBz0dVe=vXL6nJ3VOqgMjCbsK_t6gA@mail.gmail.com>
Subject: Re: [PATCH v2 11/21] arm64: dts: apple: t8103-j313: Add
 speaker/headset jack nodes
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	=?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Sen Wang <sen@ti.com>, Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 4:33=E2=80=AFAM Ajay Kumar Nandam
<ajay.nandam@oss.qualcomm.com> wrote:
>
>
>
> On 10/4/2026 11:33 AM, James Calligeros wrote:
> > +&i2c3 {
> > +     status =3D "okay";
> > +
> > +     speaker_right: codec@34 {
> > +             compatible =3D "ti,tas5770l";
> > +             reg =3D <0x34>;
> > +             interrupts-extended =3D <&pinctrl_ap 182 IRQ_TYPE_LEVEL_L=
OW>;
> > +             shutdown-gpios =3D <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
> > +             #sound-dai-cells =3D <0>;
>
> Both speaker codec nodes reference the same shutdown GPIO. Is that
> intentional for this board?
>
> The TAS2770 driver requests 'shutdown-gpios' per codec instance, and
> GPIO requests are exclusive by default. So I would expect only one codec
> instance to own this line, while the other appears to fall back to the
> register-only path after the GPIO request fails.
>
> If GPIO181 is a shared physical shutdown line for both amps, how is the
> power/reset ordering expected to work across probe, suspend, and resume
> when only one of the two codec driver instances controls that line?

We use the new(ish) shared GPIO proxy stuff[1] and it all Just Works.

[1] https://lore.kernel.org/asahi/20260831-apple-shared-gpio-v1-0-e855b12e1=
8ce@gmail.com/
