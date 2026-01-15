Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E5F25EF9C
	for <asahi@lists.linux.dev>; Thu, 15 Jan 2026 06:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768458934; cv=none; b=nZM4VfD2oNzFW1eC9DImGHdxHs5ONM98g0vZmfJdFT2px6weaXZt6lKmNdiTKJHGGhXIvKn/ooc9HT5y/g02oxQTd1KI3SNz5swnxytv9wA2JnvV1q43N+8Sf6JsakK1OTR01krasa0wPOCt/QGWNAwLAtfH2gG10MmgY98gTgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768458934; c=relaxed/simple;
	bh=if/lSj3JKx8MPnoKYvi9HyDPFLO/Aa3jzUwJxjRuWVw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E2kB1pzuoZnwEe9REp5fc5KCOes7wsAivS86O90LIAJo/X5BDLbusdtIvLy+KOBAT4kvIPlkFK0/ZVN+6H3R5duCjoMzJD600K3mG+aY421gadX41UYtiVdqfP+zqFr/HMyFt0WAFYdlrZ0Yz3ZkmvfgQK7E5rTKk6WI3t923jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dx6Uki48; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dx6Uki48"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-78fb6c7874cso5654587b3.0
        for <asahi@lists.linux.dev>; Wed, 14 Jan 2026 22:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768458932; x=1769063732; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sDL2VEo1K40CbIHkD6w0yhETsm2brUV92i2ZA2PzHJw=;
        b=Dx6Uki484zVPL4FX41cuzE/zGRUtMTsVzagEE0fjqEJNL+0I/9BEfI8agsKWBXNE9L
         oii86Y9JRYUnB5fClZiP8DEANTOE4Daeg7e3z6Fp+b9SALkgFkJt13woJglff7IJ7lrc
         gtrRCuw4szww8rcQW8qhicnd3fRoF8OCMK53QJZhsYwYx7/3kKcVha80kheWl8x4uClf
         bgMBp+ID11GV1V2xEcRU67v9N5I686HJsVgLk6vxeCBHtmP/1Tl0B9nMB7poanQAniJL
         yIM5/8IwNXMCFonViPVu8CsGu+rZscSyur9p3J3B7ldWAxg11tFxzDmrkmin0woAnWk+
         wreQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768458932; x=1769063732;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sDL2VEo1K40CbIHkD6w0yhETsm2brUV92i2ZA2PzHJw=;
        b=IJwmJ9GmWf59QVaI4ApctiPvNVAwfapR3+eiv88TO1Pa+dx3ftErrrCKSeOecfRs/8
         K5WB6WY7OT/BdqnWcaar/UIel/MKXN12IcQ2xMOA8SD/Np2BGMAg8DpB5J14Es9juL5n
         mFsOl/9NwKRgCJ9fOVcbp4RptnXD6F8ndNNwEbu4zmtFC+YHp4O2CPECQjc65ZyDBwuo
         3RDQLO+k6MY8EDwNC/N5b0DD4WgmrnY5FlK0sD1GFNmDTSkf5quKqEotfI50F9FtVtbs
         E8L4rBjq80tDGyjtzGA50klg7eaN/lhhrmpJ1CCvzQN7F6iKOBQo89U34VOb5YfsNFlT
         baeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFcE/carpvVT8Z8/anG/NSG0AoPz5WfatqHW0uZ5gseAMPFQhrzrXvK39P9TfeXrq8ILPZeg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzWnir0BDKbcNRDgaeGuHWd5iabNh1Y/6eAWBEJcXGzBF9UiKkv
	Oe105PZtbOYLx1lbSZFph2rTVgiLXLW4J+L3g4GGMBarhNqerzQVCHdPk89oScG6J9YKnGwMFXj
	I9+H9qq7t4qj2g12bg6Pb1uYL/dFh7kw=
X-Gm-Gg: AY/fxX4S9rwQ0ETsstmzPsKgyVvP7Pbi/tonsy6Uui4YU+zHJLn35ihclJuDdDtbqFC
	K11p9WmhR/gI/W1bV2af7hDoOEyc7TjNDIgXoHCmTESEqabcOt733rDlvnwAy+imVPjku+6v+Um
	4729aT5LwlatYM8iwhQ8TFgF3U0ft2b+7NhOxHLgYA2Pp11cjghWzpzQV4PC2w+57yYmS70AbVA
	x3Dy9ztIeP10cgj0kc+4hqKk6UkgYzpbBKbFCkUvxOsdRgnLCc0ybEw+23JepJYYpBe3Z1n
X-Received: by 2002:a05:690e:1883:b0:644:45ca:7bfd with SMTP id
 956f58d0204a3-64901aaebb3mr3938691d50.36.1768458931647; Wed, 14 Jan 2026
 22:35:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260109-b4-macsmc-power-v2-0-93818f1e7d62@gmail.com>
 <20260109-b4-macsmc-power-v2-1-93818f1e7d62@gmail.com> <aWbq2pgTJlOWC07w@venus>
In-Reply-To: <aWbq2pgTJlOWC07w@venus>
From: Michael Reeves <michael.reeves077@gmail.com>
Date: Thu, 15 Jan 2026 17:35:20 +1100
X-Gm-Features: AZwV_Qj589lgXQNeagebL0kthy66zD-IRnj2VDG_vPH0jpjOKd17rg1RUVEIdJs
Message-ID: <CANpmGNvBvasft9U3_=G2=B9VF1Q0P7aG8QsdLF7H+NJH9oTfKw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] power: supply: Add macsmc-power driver for Apple Silicon
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Hector Martin <marcan@marcan.st>
Content-Type: text/plain; charset="UTF-8"

Hi Sebastian,

Thanks for the review.

On Wed, Jan 14, 2026 at 1:10 PM Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:
> > +     case POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE:
> > +             if (power->has_chte)
> > +                     return apple_smc_write_u32(power->smc, SMC_KEY(CHTE), 1);
> > +             else if (power->has_ch0c)
> > +                     return apple_smc_write_u8(power->smc, SMC_KEY(CH0C), 1);
> > +             else
> > +                     return -EOPNOTSUPP;
> > +     break;
>
> Indentation?

Fixed.

> > +     case POWER_SUPPLY_CHARGE_BEHAVIOUR_FORCE_DISCHARGE:
> > +             if (!power->has_ch0i)
> > +                     return -EOPNOTSUPP;
> > +     return apple_smc_write_u8(power->smc, SMC_KEY(CH0I), 1);
>
> Indentation?

Fixed.

> > +     case POWER_SUPPLY_PROP_VOLTAGE_MAX_DESIGN:
> > +             /* Calculate total max design voltage from per-cell nominal voltage */
>
> Using the nominal voltage here doesn't make much sense. As the
> comment above mentions not having nominal voltage data for the
> battery, I suppose the comment is wrong and this uses the per-cell
> **maximum** voltage?

You are correct. I've checked again just to confirm the comment is
definitely incorrect, and not the code, and the key reports ~4.4V.
Updated now to reflect that it is using the per-cell maximum voltage,
I think I got my words mixed up when writing the comment.

> > +     case POWER_SUPPLY_PROP_CHARGE_CONTROL_START_THRESHOLD:
> > +             /*
> > +              * Read-only reflection of end threshold logic.
> > +              * Allowed to be written to avoid userspace confusion, but ignored.
> > +              */
> > +             return 0;
>
> I think it's better to fix userspace and expose the value read-only.
> In any case this creates an ABI and requires proper documentation in
> Documentation/ABI/testing/sysfs-class-power. My suggestion would be
> to drop this for now and handle it in a separate patchset, so that
> ABI discussion don't block the remaining driver.

Agreed. I have dropped the threshold properties for now to avoid ABI churn.

> > +static int macsmc_power_probe(struct platform_device *pdev)
> > +{
> > +     struct apple_smc *smc = dev_get_drvdata(pdev->dev.parent);
>
> You have a bunch of &pdev->dev further ahead, so I think it's
> sensible to create 'struct dev = &pdev->dev;' and use it everywhere
> in the probe function.

Done.

> > +             power->batt_desc.properties = power->batt_props;
>
> It seems 'power->batt_props' is not used anywhere and you can just
> use 'power->batt_desc.properties' directly?

Fixed. I've removed the struct members and assigned directly to desc.properties.

> > +             power->batt = devm_power_supply_register(&pdev->dev, &power->batt_desc, &psy_cfg);
> > +             if (IS_ERR(power->batt)) {
> > +                     ret = dev_err_probe(&pdev->dev, PTR_ERR(power->batt),
> > +                                         "Failed to register battery\n");
>
> No need to assign ret; it is unused. But it becomes necessary with
> a follow-up suggestion from me.

Fixed.

> > +             power->ac_desc.properties = power->ac_props;
>
> Just like 'power->batt_props': You can drop power->ac_props and use
> power->ac_desc.properties directly.

Done.

> > +                     /* If battery also failed or didn't exist, this is a fatal error */
> > +                     if (!power->batt)
> > +                             return ret;
>
> You can just drop this check and instead rely on the "Final check"

Done.

> > +     /* Final check: did we register anything? */
> > +     if (!power->batt && !power->ac)
> > +             return -ENODEV;
>
> You can just return ret here, if you assign -ENODEV as initial
> value. In that case the correct error code will be returned in all
> cases.

Done. I initialised ret to -ENODEV and updated the flow to return it.

> > +     power->nb.notifier_call = macsmc_power_event;
> > +     blocking_notifier_chain_register(&smc->event_handlers, &power->nb);
> > +
> > +     INIT_WORK(&power->critical_work, macsmc_power_critical_work);
>
> This must happen before registering the event handler, which in
> theory might instant-trigger an event creating a race condition. You
> already have the correct order in the remove handler (which also
> hints about this problem :)). After reordering you can further
> simplify by just using devm_work_autocancel().

Fixed. Moved INIT_WORK to the top of probe and switched to devm_work_autocancel.

> > +static struct platform_driver macsmc_power_driver = {
> > +     .driver = {
> > +             .name = "macsmc-power",
> > +             .owner = THIS_MODULE,
>
> There is no need to set platform_driver.driver.owner manually. It is
> handled automatically, so please drop.

Dropped.

> > +MODULE_ALIAS("platform:macsmc-power");
>
> Drop MODULE_ALIAS and instead add a platform_device_id table with
> MODULE_DEVICE_TABLE(platform, <NAME>);

Done.

I will send v3 shortly.

Best regards,
Michael
