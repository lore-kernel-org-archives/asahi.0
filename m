Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC15391E51
	for <asahi@lists.linux.dev>; Sat, 27 Jun 2026 09:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782553845; cv=pass; b=IyCTq6DdnRY5yQTjW0D0vdTjJJIQr5Q1EoYp9wF4fzHzQ948bnsGk6zxoNmabMPxMZlObxYRk1iaZz9GB65Rwb6Sbp3JmM2pp23ySHMAO5lwQRHqnFI9GpnlIZ+QVJ1bf8wyA1Fo7Janb9pPs/lZ77VgA0sxE0AsGTsBqQhn6ao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782553845; c=relaxed/simple;
	bh=hME/qbAWxNKH+RRiKD6tgYF/Qxg68RqOdtZkGoM7bbQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nMhVAa5Xv9PwElLZKW6IcbvhgQPj89Moq5KvjqWLixKpMkiJtq8OKZmEqKcn6Ln8Uiq7/lecPS5Tng9RJZ3aD2Yy34mftBkoqSy+j3M2f9JovlWMaghZokvB/IQslRX1t8ghJn7QfShqBrd4wuFJMdrTu+jZLM9MXIurIMC7C2U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XDO1JG5B; arc=pass smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XDO1JG5B"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84236f9b638so793844b3a.2
        for <asahi@lists.linux.dev>; Sat, 27 Jun 2026 02:50:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782553844; cv=none;
        d=google.com; s=arc-20260327;
        b=Hs6j/fFwJxVYI1osTm45aRWj+OVI3BTsS5dQZ93bC3T3YkdZ6Qka0FyVJYgnrtcfJT
         MgDRhDRjW0NCQOht9ahnMW22O9jiBnaQf59XfV0tRVfHaSYhi4t+mJ15eOWZJou/8Ot5
         aZ3Cr6VPTlnk2j3gUIFca6BHkNzsDu5/x9HRfyHY2AhWLnYeBjOALlKvEhDmhTErqB+x
         QGW5ZqHEQsdadNd9FYXYCbKd1CzZV8S1350AT+17SmJa88ZmOMpak8cu49XcfMbLV9GN
         GSrEnozXFF7RUXqpws+jSQso2BhEx4d4aK459V3v8oNWe7NMphnCmBOf0W4K/hE/fjPh
         wTMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gT0GxwXTPeiXfy1e692gDaxTDVIJ9Mn/wPIQ0mt3tv8=;
        fh=2cY+S0V0vT+7MHtSi4IjiJgk8Y6Zg+jWwydu4G1FqOA=;
        b=GA+XNFgYqHWrp4z5Jer2RDna46L6MECe15QQT8PdDRRdkIJjoSqvtW7dungdsjXljr
         rlDr0aEKUKvSN4ra3ZT2yFzOAFp9KzYz6Gp3q64HDHkW9x4kyowLNLshqS00DFYL+XU7
         IGRKjU4uhY8yZjweZlom9OvyU5BKGGOlKdqXUUyR6HZ19pILu07ARALavJTR+nCHOkMC
         2vznjXuzguBz3u8Zxv8G0rGHh4HUzvBaEQiFTlS7Ge3dmJRNWCDHgzwObufKJOlWh64E
         CHA2MBk8fNBmRjGGxfxJ0v2d4f4HCh6ymbDypmWQnVoYsIKhVuzTxJI5FsSvV2ul3XID
         44xA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782553844; x=1783158644; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gT0GxwXTPeiXfy1e692gDaxTDVIJ9Mn/wPIQ0mt3tv8=;
        b=XDO1JG5BfXDrOtTvDPLnItTYxX5dFv8IWyCzKtWaOap8KQxwbmEcXthD3B/o81mDFJ
         Oenx7ZEFjU/UIxn0oz0vafTLuLfVeJVlr5dxfwk67dodg8+tp+EuMQw1QrfiLYFdzZE5
         0yDExYrO/FLg/qq1NTzljgOg1i49Xetxd3yCAZ4rWRQX7QwntSKHjLrapH+y6HzVMrQi
         mDp4BGULlqaZSERobN/qOz3NmELynidebxyfZQAy2tOaaySPtouIdErvm9mOIILMyWcE
         CSy9CZUQk74canNkdIYwLlOBuPIh5NJiL1gx/aIvakQ4QH4usrtSNSlHUBAaKrDmXRxF
         H6SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782553844; x=1783158644;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gT0GxwXTPeiXfy1e692gDaxTDVIJ9Mn/wPIQ0mt3tv8=;
        b=CPNi02+P8nNiIwpWCANJATZQiFEuK8bNhXRVc1OMLoMRF4zr7gN5DsnCk+zWESuGai
         mVbzxXMCbqXSxNVAD9BS1WLSoI0SYH8qdkjadx4AjLuvJ7Pz/16SduLp16tlr7WcZhyQ
         shXWCOIyRZFmhqwhxwDVOh1ENvYRTjHhMb84s6eiNCnrzfikC3zOZ7PWTEA3e+XIRn4X
         FooiNOUBTmpfNOEAFJ3QbyTNh4BYQVvSAtGQG5Dc07TovrWcF0Vaq5Dn7i+WLII66M2+
         jGnWkWUlfrcWxLurv6h4XgweQmmVMZf5GpHT2ruMeENED1c2v98xjN6CIAjFZZF7YIMJ
         A4Zg==
X-Forwarded-Encrypted: i=1; AHgh+RqF63oxlbhkUTHW4W857urK+I/e96p2tdBdOaqHLr01sb80q+FpZjXEgQIMpDoWdy4/1YjBuQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwsszqsG8eMyxvFHsebc+KFbbhnum8qumiU/F0tpT0qNIpVYfO6
	/mmuzVIcMq+DGjHmxmbOtXfsyK40KScF1q/K3lfohHCgKTeWk63PcZB4OpXp1PtzV2aS+dFi+k8
	PjmkSE0VToBWsx4W8O/cvyRSDXTb3Ofs=
X-Gm-Gg: AfdE7clrcMICkpThRH9WyQEeTxOy2wPqePghXqCYguMRs9O9LV+drojXPqHu137wpk9
	aSrzrA1K4DxRGjXt2y32r6nNq6Gz7Ai1Ccz/9I+qt3El76kcUR5pvPom17fMsgDSf6z5NsIiiDC
	mRdlj/fBRW8cL/E+SMl7OEy3Evw6fR8CK3RSiIW/FnczsWyEBFDS0ylsMdiR9AvHgy/JQrbl6CK
	BVyJ0cnVsKuocHuG55lUW+kYEryhas3UQTiEB1sYiWoAp04k74jP+QfGWv2l9OyDGFvtGZSjgPL
	kWYzJcWNnKdf+eAFP32t/VlSZPB14Kq9wPM37kdESO4cUSSw2V1PlHebqQ+Wzg==
X-Received: by 2002:a05:6a00:94d5:b0:845:ddc9:2717 with SMTP id
 d2e1a72fcca58-845ddc97bd7mr1049159b3a.4.1782553843902; Sat, 27 Jun 2026
 02:50:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260626061329.23264-1-phucduc.bui@gmail.com> <20260626061329.23264-16-phucduc.bui@gmail.com>
 <aj5a7pgaDoN30Gs5@opensource.cirrus.com> <CAABR9nG9jDfK_wqS4Akfz5GL6HvZ-RkpPuYx4Q=vMn5jH_0foA@mail.gmail.com>
In-Reply-To: <CAABR9nG9jDfK_wqS4Akfz5GL6HvZ-RkpPuYx4Q=vMn5jH_0foA@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 27 Jun 2026 16:50:31 +0700
X-Gm-Features: AVVi8Cd_wdrnWNlCE3sFhO5Ei165WoKyvN2rXVN0sU7ML0KMoWVobNpNmXuVrxo
Message-ID: <CAABR9nE1GAPaOF8jx1C925POe9AbgkPs-ZRSn9hiTEz-_mvwTA@mail.gmail.com>
Subject: Re: [PATCH 15/24] ASoC: codecs: cs42l43: Use guard() and PM runtime
 scope helpers
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, David Rhodes <david.rhodes@cirrus.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
	Cheng-Yi Chiang <cychiang@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Benson Leung <bleung@chromium.org>, Richard Fitzgerald <rf@opensource.cirrus.com>, povik+lin@cutebit.org, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@opensource.cirrus.com, chrome-platform@lists.linux.dev, 
	asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2026 at 7:57=E2=80=AFPM Bui Duc Phuc <phucduc.bui@gmail.com=
> wrote:
>
> > > ---
> > > -     if (!jack)
> > > -             goto done;
> > > +     if (!jack) {
> > > +             regmap_update_bits(cs42l43->regmap, CS42L43_HS_BIAS_SEN=
SE_AND_CLAMP_AUTOCONTROL,
> > > +                                CS42L43_JACKDET_MODE_MASK |
> > > +                                CS42L43_S0_AUTO_ADCMUTE_DISABLE_MASK=
 |
> > > +                                CS42L43_HSBIAS_SENSE_TRIP_MASK, auto=
control);
> > > +             regmap_update_bits(cs42l43->regmap, CS42L43_PDNCNTL,
> > > +                                CS42L43_RING_SENSE_EN_MASK, pdncntl)=
;
> > > +             dev_dbg(priv->dev, "Successfully configured accessory d=
etect\n");
> > > +
> > > +             return 0;
> >
> > I really don't like this duplicating of code blocks, it takes us
> > to a situation we always need to remember to update both blocks
> > in sync which feels like it makes reviewing future patches very
> > error prone.
> >
>
> Hi Charles,
>
> I understand your concern about duplicating the code.
>
> My reasoning is that duplicating this block once lets us eliminate 12
> `goto` labels,
> which I think makes the overall flow easier to follow. To me, that's a
> reasonable trade-off.
>
> If you have a cleaner approach that avoids both the duplicated block
> and the 12 `goto` labels,
> I'd be happy to adopt it.
>
> Best regards,
> Phuc

Hi Charles,

I'll factor the duplicated code into a helper and use it from both
paths in v2, for example:

static void cs42l43_apply_accdet_config(struct cs42l43_codec *priv,
                    unsigned int autocontrol, unsigned int pdncntl)
{
    struct cs42l43 *cs42l43 =3D priv->core;

    regmap_update_bits(cs42l43->regmap,
CS42L43_HS_BIAS_SENSE_AND_CLAMP_AUTOCONTROL,
               CS42L43_JACKDET_MODE_MASK |
CS42L43_S0_AUTO_ADCMUTE_DISABLE_MASK |
               CS42L43_HSBIAS_SENSE_TRIP_MASK, autocontrol);
    regmap_update_bits(cs42l43->regmap, CS42L43_PDNCNTL,
               CS42L43_RING_SENSE_EN_MASK, pdncntl);

    dev_dbg(priv->dev, "Successfully configured accessory detect\n");
}

Then both paths can simply call cs42l43_apply_accdet_config(),
avoiding the duplicated code.
Does that address your concern?

Best regards,
Phuc
