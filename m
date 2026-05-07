Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364B0363C73
	for <asahi@lists.linux.dev>; Thu,  7 May 2026 12:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778155580; cv=none; b=PB/xkr7/u4GCKHWm3DjVnqqFuq6nGY4Cbn5qV6/VRnK254kuH6ytaXAA52A7+g6IWqKI3vPT97wJKuoSScc72Xlk4UV39QSuv9BtQYJqvqT0mj7Z86F5HGwIjxz0DMfDc4/SHSVNqmQcT7mMS6D9v7hIJ8TGf4zocjNoB/feM+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778155580; c=relaxed/simple;
	bh=OBX4s8WsQd+wXEMHuIDsAItYLsJGFZJzz/LfOjLU4Qw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YgI050wW9jKPS5kVz7wFQhJbZ679amFDUB4e+j/8aCnO05nIoK7NxNzUB3Pgk3j7cVikiv/S0+koVrCt4s4yxKXeCSyDc1GgtvquWIfFP7Nwz0K2iK3BplfkZezdk0SFix+8OHTY+FWaEJGNcyikH3F9Jd2BFR28lBzDx39EYAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VEI2tW+A; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VEI2tW+A"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-44a786a9b8aso90951f8f.0
        for <asahi@lists.linux.dev>; Thu, 07 May 2026 05:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778155577; x=1778760377; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xw5SJ5ouCRYB/b5GcNxozXNcJ8qmSd+3bPwo/jj3Nqc=;
        b=VEI2tW+AmmQwFlxorfP98JYy458jWUP799m2VOmpk5zgMak4dxKwX2vQ6FOCz8rFfX
         XwqL/UCxUvi080gBLdkVUINT7D28HK4nyEQQSJL0liZX5JK+fjkVLszZqa3eFtZ+hnA5
         bByasKtJdTx9EaZl3+H6AE72BOgD9HhZ2yxNnSYrDdjzXz335nmQfCj5ZcenmK1tYuQl
         4ttAasN1Qnmr7P+6BO7mC2vtzEFViDSzcZzTpRtBbn9wiPZIE+JK87YGd7e11ULfLoB/
         GONqHVwVLKFibLrC7jIB1nlvJokWFvbdaE2jLnvWJdARDebLDNcs8ck1yzAmPCbH76i2
         KObQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778155578; x=1778760378;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xw5SJ5ouCRYB/b5GcNxozXNcJ8qmSd+3bPwo/jj3Nqc=;
        b=HQhMZ/cYlH7bpaC8SS9sPYVasfnoU8Tiqkfvm25toolq9DsVjQiq53c1mJLXn8xij7
         JBmUJXeci38/M/RGRE6g6S/dGBGwAWWZndDDWVOkULh35cpeWn4MV/kKPLHarYPPAgq5
         qO8/xx9dGQOCba3UIPRzaHJPIjlaKhpOIy00FjAzKZFhnjHWEI1eIW9jehB+4s0Nw5tV
         7OWrnsZj8n16VD433g2U4pEOpdkn/NxjkkpXcXjUvLxd84nVhi+DBsf3S/7pWhfQhcwR
         0o6xn4VGf4cMml0rujXYy/EwkB5liY38yRLMh0m//ctk7PJzvg5dVUOG2FVXwC4NGYQS
         ChJA==
X-Forwarded-Encrypted: i=1; AFNElJ+S4XoKx49VLCkw9DB4jPnKkd8OWdCnT/qcqO7SmjdJs084eb33VPQvounfH0CznwfpvgvzHA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy71BMe8PY2dnPE194IKZ4VMGmOQHununsX6ecG2ijAsUxRzOpM
	rzeeJRfbDem1ixijVx3EZNfEnEJikTJiTMXVKdYbkeS+zv3vue4ERAlu
X-Gm-Gg: AeBDiet8dZSGYObFafjTUTM3mubcZ/Rg/1g855eT8+MdDQO+ned17a84Qwj+ER8rh9C
	fjZcIdOqMsRlNXivi/XaYZ48Elr6ZwT6y7rAxKbcm9v5C7osmBpknSe+BUwpcb2YIbp2OOeqR0a
	jIrhdLglPTwyQHs7hPcvujAIZfZh++QCWDsUND8/KUCqJOmv0zt229VVtAcFG3LlJ7nCF75ry3a
	VKuTpSqNxcJEN2vxh+kw7i6WSo9LnyBCWjRjt/wMx4kX34/+dGKs9+2B5aMXafnmCuGODvUnwlM
	SqStDgAgmXaAKHCnKssjFggJ06ldab1PjyitgMEvnnJMvbh/qn/BLmWura5SOfNjVpCmPbCDp98
	rPHgXTI9DZU9P2+aaKHzcTmNrB7AA4CYLGNw8FF7ws9uWrpcL555IWsw4pJiBlfzdH3jBBJPqll
	nNzfazFhcSEqbOkpnEimhf7Avkyhu+zEDTFenB
X-Received: by 2002:a05:6000:4517:b0:448:71e8:4b3b with SMTP id ffacd0b85a97d-451a71f62e6mr3350578f8f.5.1778155577326;
        Thu, 07 May 2026 05:06:17 -0700 (PDT)
Received: from skbuf ([2a02:2f04:d403:cf00:be4e:5cc8:5753:4a2f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055960902sm21613178f8f.28.2026.05.07.05.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 05:06:16 -0700 (PDT)
Date: Thu, 7 May 2026 15:06:14 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: David Carlier <devnexen@gmail.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Hector Martin <marcan@marcan.st>,
	Philipp Zabel <p.zabel@pengutronix.de>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: apple: atc: Fix typec switch/mux leak and UAF on
 unbind
Message-ID: <20260507120614.jlygedfycdjxbvoo@skbuf>
References: <20260420231014.35462-1-devnexen@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420231014.35462-1-devnexen@gmail.com>

Sashiko says:

commit 13bcb3149b5056d5815f8cd52f9e018076602989
Author: David Carlier <devnexen@gmail.com>
phy: apple: atc: Fix typec switch/mux leak and UAF on unbind

This commit addresses a typec switch and mux leak during unbind by
saving the registered devices and unregistering them via
devm_add_action_or_reset. It also drops unused struct fields.

> diff --git a/drivers/phy/apple/atc.c b/drivers/phy/apple/atc.c
> index e9d106f135c51..4156fabad742c 100644
> --- a/drivers/phy/apple/atc.c
> +++ b/drivers/phy/apple/atc.c
[ ... ]
> @@ -2066,15 +2063,25 @@ static int atcphy_sw_set(struct typec_switch_dev *sw, enum typec_orientation ori
>  	return 0;
>  }
>
> +static void atcphy_typec_switch_unregister(void *data)
> +{
> +	typec_switch_unregister(data);
> +}
> +
>  static int atcphy_probe_switch(struct apple_atcphy *atcphy)
>  {
> +	struct typec_switch_dev *sw;
>  	struct typec_switch_desc sw_desc = {
>  		.drvdata = atcphy,
>  		.fwnode = atcphy->dev->fwnode,
>  		.set = atcphy_sw_set,
>  	};
>
> -	return PTR_ERR_OR_ZERO(typec_switch_register(atcphy->dev, &sw_desc));
> +	sw = typec_switch_register(atcphy->dev, &sw_desc);
> +	if (IS_ERR(sw))
> +		return PTR_ERR(sw);
> +
> +	return devm_add_action_or_reset(atcphy->dev, atcphy_typec_switch_unregister, sw);
>  }

Could this lead to a use-after-free if consumers still hold a reference to
the switch or mux?

When the driver unbinds, devm cleanup runs and frees the apple_atcphy
structure. The devm action calls typec_switch_unregister(), which drops the
sysfs representation but doesn't free the device object if a consumer (like
TCPM or a Type-C port driver) still holds a reference.

If the consumer is not unbound concurrently, it retains the reference and
remains active. Unregistering the switch does not clear its .set callback.
If a cable replug or orientation change occurs, the consumer could call
typec_switch_set(), which would invoke atcphy_sw_set().

Since atcphy_sw_set() extracts the freed apple_atcphy pointer from drvdata
and attempts to acquire its mutex, could this result in a use-after-free?
[ ... ]

> @@ -2146,15 +2153,25 @@ static int atcphy_mux_set(struct typec_mux_dev *mux, struct typec_mux_state *sta
>  	return atcphy_configure(atcphy, target_mode);
>  }
>
> +static void atcphy_typec_mux_unregister(void *data)
> +{
> +	typec_mux_unregister(data);
> +}
> +
>  static int atcphy_probe_mux(struct apple_atcphy *atcphy)
>  {
> +	struct typec_mux_dev *mux;
>  	struct typec_mux_desc mux_desc = {
>  		.drvdata = atcphy,
>  		.fwnode = atcphy->dev->fwnode,
>  		.set = atcphy_mux_set,
>  	};
>
> -	return PTR_ERR_OR_ZERO(typec_mux_register(atcphy->dev, &mux_desc));
> +	mux = typec_mux_register(atcphy->dev, &mux_desc);
> +	if (IS_ERR(mux))
> +		return PTR_ERR(mux);
> +
> +	return devm_add_action_or_reset(atcphy->dev, atcphy_typec_mux_unregister, mux);
>  }

Are we exposed to the same issue here with typec_mux_unregister()?
If a consumer still holds a reference to the mux device after the driver
unbinds and devm frees apple_atcphy, could an alt-mode transition invoke
atcphy_mux_set() and access the freed memory?

[human]

Basically it is stating that consumers will continue to hold a reference
to the Type-C mux and switch even if you go to the extent of unregistering
them from the framework. This is a known problem in many subsystems;
even the PHY framework suffers from it.
https://lore.kernel.org/linux-phy/aZejMSJ9qqRWb2pX@google.com/

I don't know how the Type-C framework deals with this, so maybe you can
clarify in your commit message what kind of problems the deregistration
will get rid of, and what kind of problems it won't.

How do the cable replug or alt mode changes trigger calls to
atcphy_sw_set() and atcphy_mux_set()? A call stack would help.

Ideally you want to help the reviewer understand that the change is
obviously correct and takes into consideration all relevant factors.
