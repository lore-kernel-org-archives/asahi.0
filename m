Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E256865F
	for <asahi@lists.linux.dev>; Wed,  2 Nov 2022 09:02:31 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id v4-20020a17090a088400b00212cb0ed97eso1332104pjc.5
        for <asahi@lists.linux.dev>; Wed, 02 Nov 2022 02:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3lW+SEAwaQj22Ep5QkmznnP/cF5sNnG1Gxo6Sa2AZ74=;
        b=zMACeZbTZl8Q3wbIi8TRiige4VbN1aGqtrYun5aTANcuZZe+p7qmASVXONqOc8BnjO
         EXUpfbpmLT4aldBZy+mhaQUupoCUeZZt6VqjUbjTA9X4Zx3bRl3erk2FCZAgbGp7SbmI
         1xnzVLkngnIJP+qZvFQ1rW/oLf4sRdaTM8kS6enQOg0wRQ215McLO0h9oGWZPvVnsl9D
         FerDzddgYMI4QPktFlJyuv7L6Q54iEHyS7k5k2aX6/fOVvEu2UapwdObqqF0mf9Zw2yc
         VBsphQ7BS33X/JO7bmpx6UWnuCfJXDYNgtfzX7OKuD7AyX9aWhXpBzu03Pc+GrnrujDL
         YNTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3lW+SEAwaQj22Ep5QkmznnP/cF5sNnG1Gxo6Sa2AZ74=;
        b=IxwSBYx5bYi3LCcl13vjAGvPXuorMAdTikxNYK/bDWQvFlfAm/h2CSxSPS86oPoHrx
         xyJTOjdRcDE+rpFbkl5uMEDUAVgH+8gd40LoEJUhsG4xail06AdqWOlGlGh0VKoJxjSk
         OaDtlkgcVQrZvz/afMEcusvxjKbLXPgizS3uZSe7gkKbKeltIwS4F7piQLzl0FQxVpJ3
         eEy8sNmYz6t9zXhXcJ0DjmvgVGJxbpGo7AcZGMYeb04/lJqn7ei/iH4OYYzE7PhJYQTS
         4dJyhBWOw0ezMT+WwStIbR8Sug3z98uYDseqdAPcFYki4OhzB5VWQKkyRlc0JiljkmjK
         vuow==
X-Gm-Message-State: ACrzQf3yl8XGD1Xob2JxoFGqYtbaPcaiqA5hfCp6VTsck7AAm8o2GAam
	d82/gJ3I2YnT3399CY2XJBMCbw==
X-Google-Smtp-Source: AMsMyM6PALNUlom1rlSsoWaB+9NYnSm8AiAITHIXsiK1BSybVbtqKeCAusR4sDxJ3wdLnUx7GI0NlQ==
X-Received: by 2002:a17:902:8e88:b0:185:3cea:6335 with SMTP id bg8-20020a1709028e8800b001853cea6335mr23860226plb.96.1667379751258;
        Wed, 02 Nov 2022 02:02:31 -0700 (PDT)
Received: from localhost ([122.172.84.80])
        by smtp.gmail.com with ESMTPSA id a3-20020a170902ecc300b001868ed86a95sm7830304plh.174.2022.11.02.02.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 02:02:30 -0700 (PDT)
Date: Wed, 2 Nov 2022 14:32:28 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: vireshk@kernel.org, sboyd@kernel.org, nm@ti.com,
	linux-pm@vger.kernel.org, asahi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] OPP: decouple dt properties in opp_parse_supplies()
Message-ID: <20221102090228.odyt7ykdkcbdx4lw@vireshk-i7>
References: <20221030101546.29306-1-jcalligeros99@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221030101546.29306-1-jcalligeros99@gmail.com>

On 30-10-22, 20:15, James Calligeros wrote:
> The opp-microwatt property was added with the intention of providing
> platforms a way to specify a precise value for the power consumption
> of a device at a given OPP to enable better energy-aware scheduling
> decisions by informing the kernel of the total static and dynamic
> power of a device at a given OPP, removing the reliance on the EM
> subsystem's often flawed estimations. This property is parsed by
> opp_parse_supplies(), which creates a hard dependency on the
> opp-microvolt property.
> 
> Some platforms, such as Apple Silicon, do not describe their devices'
> voltage regulators in the DT as they cannot be controlled by the kernel
> and/or rely on opaque firmware algorithms to control their voltage and
> current characteristics at runtime. We can, however, experimentally
> determine the power consumption of a given device at a given OPP, taking
> advantage of opp-microwatt to provide EAS on such devices as was initially
> intended.

Do you supply a regulator to the OPP core for your platform ?

> Allow platforms to specify and consume any subset of opp-microvolt,
> opp-microamp, or opp-microwatt without a hard dependency on opp-microvolt
> to enable this functionality on such platforms.
> 
> Fixes: 4f9a7a1dc2a2 ("OPP: Add "opp-microwatt" supporting code")

I won't call it a fix, we are trying to use this information in a
different way here, that's all.

> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
> Changes since v1:
> Fixed bad reference (opp to opp_table)
> 
>  drivers/opp/of.c | 198 +++++++++++++++++++++++++----------------------
>  1 file changed, 104 insertions(+), 94 deletions(-)
> 
> diff --git a/drivers/opp/of.c b/drivers/opp/of.c
> index 605d68673f92..0fa25c3a959e 100644
> --- a/drivers/opp/of.c
> +++ b/drivers/opp/of.c
> @@ -581,166 +581,176 @@ static bool _opp_is_supported(struct device *dev, struct opp_table *opp_table,
>  static int opp_parse_supplies(struct dev_pm_opp *opp, struct device *dev,
>  			      struct opp_table *opp_table)
>  {
> -	u32 *microvolt, *microamp = NULL, *microwatt = NULL;
> +	u32 *microvolt = NULL, *microamp = NULL, *microwatt = NULL;
>  	int supplies = opp_table->regulator_count;
>  	int vcount, icount, pcount, ret, i, j;
> -	struct property *prop = NULL;
> +	struct property *prop_mv = NULL, *prop_ma = NULL, *prop_mw = NULL;
>  	char name[NAME_MAX];
>  
>  	/* Search for "opp-microvolt-<name>" */
>  	if (opp_table->prop_name) {
>  		snprintf(name, sizeof(name), "opp-microvolt-%s",
>  			 opp_table->prop_name);
> -		prop = of_find_property(opp->np, name, NULL);
> +		prop_mv = of_find_property(opp->np, name, NULL);
>  	}
>  
> -	if (!prop) {
> +	if (!prop_mv) {
>  		/* Search for "opp-microvolt" */
>  		sprintf(name, "opp-microvolt");
> -		prop = of_find_property(opp->np, name, NULL);
> -
> -		/* Missing property isn't a problem, but an invalid entry is */
> -		if (!prop) {
> -			if (unlikely(supplies == -1)) {
> -				/* Initialize regulator_count */
> -				opp_table->regulator_count = 0;
> -				return 0;
> -			}
> +		prop_mv = of_find_property(opp->np, name, NULL);
>  
> -			if (!supplies)
> -				return 0;
> -
> -			dev_err(dev, "%s: opp-microvolt missing although OPP managing regulators\n",
> -				__func__);

Catching such errors are important and so the opp-microvolt property
was made compulsory earlier.

If there is a regulator, then we must have microvolt property.
amps/watts are optional.

> -			return -EINVAL;
> -		}
>  	}
>  
> -	if (unlikely(supplies == -1)) {
> -		/* Initialize regulator_count */
> -		supplies = opp_table->regulator_count = 1;
> -	} else if (unlikely(!supplies)) {
> -		dev_err(dev, "%s: opp-microvolt wasn't expected\n", __func__);
> -		return -EINVAL;
> +	if (prop_mv) {
> +		vcount = of_property_count_u32_elems(opp->np, name);
> +		if (unlikely(supplies == -1))
> +			supplies = opp_table->regulator_count = vcount;

This is wrong. There can be one or three entries per regulator here.
Target or min/max/target. If the supplies value is -1, we can only
support one regulator, i.e. one or three entries total.

I didn't look at rest of the patch yet. Lets discuss this a bit first.

-- 
viresh
