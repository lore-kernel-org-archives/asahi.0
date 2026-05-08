Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033123101C0
	for <asahi@lists.linux.dev>; Fri,  8 May 2026 20:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778270479; cv=none; b=BFAlwylwXQ7Ap2eXznpJIO2+aECFZRad9zSH7NgzK3zUcty5+EVY5sPXzAxoSwjNE+K8lVXlKaVfp4jxkMyCwZJ/L31ZzCb38+N06CG7oWz1uEt2JLvLiKgLVEaqDIsvhgR4Df5l2cUtKlUzSCD6uDIZCEa7hl8cQ0IksTa8UcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778270479; c=relaxed/simple;
	bh=AedjIHx2h7U8POzEY1YlJLqb4MLGPWsVjlhwxeTXQew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dASNxt1vJFw3bWgs7N6piLhX16wV1Ea+5RfPdxcPLQQkKF9RRtlMfa2Upg75B14JaSr5a4CgrhNAdKqj0JJzZPPmosftJpmsC6xKeN3uIDkgXSrzpmFfFKlGO6toxRYNoY72es/hUahlETqi7OEkEmFK0sVYxxsKCBQq9yGpLeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CVxbIMIf; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CVxbIMIf"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4891cd5927dso2191535e9.0
        for <asahi@lists.linux.dev>; Fri, 08 May 2026 13:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778270475; x=1778875275; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sYQhrTlIzdCXJRNGCpKZc0uS+MwI2bptTg0r3gmq+RE=;
        b=CVxbIMIfLJu52aOsnwuU2SNdZt4kxU2OW53ldl+1lxR7FuOVdaYjFBfezm6zKGvBex
         QH6+VQ22KzbShFa/tz7DZd1KaJhoSyo41htfkeVJjkvnfnre+62HIbvoPdN1fjFOEYT2
         pSDu+911R3o7XtdVseJ3PclFVETvXh3N/X4y1mxM7mcsXSzMw6dHucZKZyBoRfaYENxk
         uXFKBwtHTSIW5D0tJg5kpgy8PTEe8sUR/2eZAX8uGYyYaiYFih3DK2JwEzBwYr4Jd2/G
         eJVDROAFD/xCYU4ERSLOwlckTZaUX80aSaR1NbalaN2LTKw578fGOhJxRZxagpc9qiJg
         Zwgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778270475; x=1778875275;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sYQhrTlIzdCXJRNGCpKZc0uS+MwI2bptTg0r3gmq+RE=;
        b=nGO+PrIOB2MMke2sLmx34nkgbh8xWdsS9sMeXv5ufXJyTD/siNZZ8fjbFaPeY1dhWG
         yZ+6ma32m7w7a6F3yJBNxDhCwEqQp/6YTqtecoxsqsE2QyhbxBcjR80/JPQSWjjy4fWv
         xglaBiroBV/I/mRHEJvublGqTRZ8/g+x5XkiI0154XwE9E5UP3d9/BhbpUGxfP6pdqpJ
         Dq2k9CtVdSN7+/sfj4ck8rvr6RMdHM+CfIle5k1WsMZIQpS1bkSu1eqlK7Hv2uB/6jet
         ZDT0D0mDYZHBpmVmEtfWQ3wheSxjnCpSkQ758fT+lDzFDv9lvq/zfiHbr5KQ1Ys5Lwa9
         PnjQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Vzv8zIoO9iPWLdg5cK9CyXiNvnvXxtWKJ/92Nk2U/UqYp/77gV1lmHA3nGqoYWvhisyguVQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxHpM8mVwRBIqQHQZxATPfH3VQmouismhaXtxP61b8cSTExT7ZB
	HFZPCeBFvKvY4QocajQXYavsF16liWsZ8I1ilB9jvzjEKlX+68B0zqe6
X-Gm-Gg: AeBDiet939A+7Rt7OptNuVibdImWrFSlkHaVAr8FPiTevZb1uQNo5K05bxWUjAAY+bH
	Q6dylHnc1RR/ydoR0pWiggAIICm3PQWfXAN/ChF34FgUFvFU+FniUBvLEGXAb3dr4CAUAPsXx4E
	VhLtccRJgGH83++h4cRKBcMrbZYXnIApbrIkYSX3MCj0wLR14sOmqswU61j5kEhfhXsOWUWO4uI
	/EgysuRD1kmLv0JBfWMpJlQDPDI0sHzmoa5FPpI50xORw5z4mYZIglrCJLz4mlErDqaFTnhgtJ3
	Lg9fG0rDldmiL/YdMSrqPlwcPRonRAdXuG8nhgdqVsu5dp4lmszh6BUHbkeDTn/OcJeC9zcOfGu
	3pOxoLK4wy5/D6j+XolYrCi6rVs7jI0jitrvoVvLgehupfQgVM1YbQx7JN/mBrF+OaZyHYLHfmC
	Oi2cBa3zBhqiofFSk=
X-Received: by 2002:a05:600c:4755:b0:48a:5546:619e with SMTP id 5b1f17b1804b1-48e51f4534amr113202975e9.4.1778270474915;
        Fri, 08 May 2026 13:01:14 -0700 (PDT)
Received: from skbuf ([2a02:2f04:d403:cf00:7892:5318:c552:d08f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45492271510sm8325074f8f.37.2026.05.08.13.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 13:01:13 -0700 (PDT)
Date: Fri, 8 May 2026 23:01:11 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: David Carlier <devnexen@gmail.com>
Cc: sven@kernel.org, j@jannau.net, neal@gompa.dev, vkoul@kernel.org,
	neil.armstrong@linaro.org, marcan@marcan.st, p.zabel@pengutronix.de,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] phy: apple: atc: Fix typec switch/mux leak on unbind
Message-ID: <20260508200111.kfl2a6u6gzacsvu4@skbuf>
References: <20260507163746.108086-1-devnexen@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507163746.108086-1-devnexen@gmail.com>

On Thu, May 07, 2026 at 05:37:46PM +0100, David Carlier wrote:
> atcphy_probe_switch() and atcphy_probe_mux() discard the pointers
> returned by typec_switch_register() and typec_mux_register(). The
> platform driver has no .remove callback, so when the driver unbinds
> (e.g. via sysfs unbind) neither typec_switch_unregister() nor
> typec_mux_unregister() is called. The framework reference taken in
> typec_switch_register() (device_initialize() + device_add() in
> drivers/usb/typec/mux.c) is therefore never dropped and the
> typec_switch_dev / typec_mux_dev objects stay live forever, with
> their sysfs entries under the typec_mux class also left behind. A
> subsequent rebind cannot recreate them with the same fwnode-derived
> name.
> 
> Save the registered handles and unregister them through
> devm_add_action_or_reset() so framework registration is torn down
> in step with the driver's other devm-managed state. While here,
> drop struct apple_atcphy::sw and ::mux: they were declared with the
> consumer-side types (typec_switch *, typec_mux *) instead of the
> provider-side types and were never assigned.
> 
> Scope of the fix
> ----------------
> This patch fixes the registration leak only. It does not close the
> use-after-free window that arises when a consumer that obtained a
> reference via fwnode_typec_switch_get() / fwnode_typec_mux_get()
> outlives the provider unbind: such consumers keep the underlying
> typec_switch_dev / typec_mux_dev alive past device_unregister(),
> and a later typec_switch_set() / typec_mux_set() still invokes the
> registered atcphy_sw_set() / atcphy_mux_set(), which dereferences
> the freed apple_atcphy through typec_{switch,mux}_get_drvdata().
> 
> On Apple Silicon the relevant consumers are the typec port and the
> cd321x controller registered by drivers/usb/typec/tipd/core.c.
> Cable plug / orientation events and alt-mode transitions trigger
> the .set callbacks via:
> 
>   tps6598x_interrupt()                 drivers/usb/typec/tipd/core.c
>     tps6598x_handle_plug_event()
>       tps6598x_connect()/_disconnect()
>         typec_set_orientation()        drivers/usb/typec/class.c
>           typec_switch_set(port->sw)   drivers/usb/typec/mux.c
>             atcphy_sw_set()            drivers/phy/apple/atc.c
> 
>   cd321x_update_work()                 drivers/usb/typec/tipd/core.c
>     cd321x_typec_update_mode()
>       typec_mux_set(cd321x->mux)       drivers/usb/typec/mux.c
>         atcphy_mux_set()               drivers/phy/apple/atc.c

Ok, so the claim from v1 that this patch fixes crashes from these
code paths is not correct, since there is nothing that would make the
typec port drop its references acquired via typec_switch_get() and
typec_mux_get().

> Closing that window requires framework support for invalidating
> consumer-held references on provider unbind. The same
> consumer-survives-provider pattern has been discussed for the PHY
> framework [1] and is out of scope here.
> 
> [1] https://lore.kernel.org/linux-phy/aZejMSJ9qqRWb2pX@google.com/
> 
> Fixes: 8e98ca1e74db ("phy: apple: Add Apple Type-C PHY")
> Signed-off-by: David Carlier <devnexen@gmail.com>
> ---

The commit message is much better. But there is a checkpatch issue which
appears to be valid, see:

commit 931d5c36c7369b65adb9e3d197a8d3a8a913db8c
Author: Joe Perches <joe@perches.com>
Date:   Fri Jan 16 09:42:52 2026 -0800

    checkpatch: add an invalid patch separator test

    Some versions of tools that apply patches incorrectly allow lines that
    start with 3 dashes and have additional content on the same line.

    Checkpatch will now emit an ERROR on these lines and optionally convert
    those lines from dashes to equals with --fix.

    Link: https://lkml.kernel.org/r/6ec1ed08328340db42655287afd5fa4067316b11.camel@perches.com
    Signed-off-by: Joe Perches <joe@perches.com>
    Suggested-by: Ian Rogers <irogers@google.com>
    Cc: Andy Whitcroft <apw@canonical.com>
    Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>
    Cc: Kuan-Wei Chiu <visitorckw@gmail.com>
    Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>
    Cc: Namhyung kim <namhyung@kernel.org>
    Cc: Stehen Rothwell <sfr@canb.auug.org.au>
    Signed-off-by: Andrew Morton <akpm@linux-foundation.org>

I don't have such tooling (git am from version 2.43.0 applies the patch
without discarding the text beneath "Scope of the fix" just fine), but
the commit is from Jan 2026, so that tooling must still exist somewhere.
So please resent with different formatting somehow (either a space
before the title, or replace the ---- with ==== or ~~~~, whatever).

With that addressed, please add:

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
