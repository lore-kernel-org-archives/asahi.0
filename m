Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D693214
	for <asahi@lists.linux.dev>; Tue, 29 Nov 2022 23:28:39 +0000 (UTC)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-1322d768ba7so19050518fac.5
        for <asahi@lists.linux.dev>; Tue, 29 Nov 2022 15:28:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rUKc4mR/Mfwu7jkjJVB/sckWcE9ThlfDvPuBAfuHKEo=;
        b=6IPH7BOiKkqajoPdiL8JaneUK98v/NL5txbSh9Hk5ptbR6N0PZaXrEl9aYP37j5xn7
         AfMDdVCKYqLjk33AZD1aVpy/IF9X2uiwo9h9tTSbyiIo9JkY62JNGXud/1f/fN65yHgE
         KQ7zlGocBnjxRT+8kWpnwPicE8uyRqOv2ZRuQVorgYDtKadVTczMPx1viloHugfdRTmM
         xY1nt7RUyGfUB+vwKkBPc946EmB/OH8mlePZvK/TWHeco++6SHGdmkq/vOYXuffoFb+d
         CHN+T5bOy+MO3UjbPshzzFW2zlF0DBrVxDcqM5C9HM1HYb0qthSCd0CJEQJJqneFnTdT
         oDRA==
X-Gm-Message-State: ANoB5pmGYxN1rE3OHMjJNXDw/tnNxKQikqlWKI00O9lHPPvkQY2g9aN1
	L699EkAJwvFKykZc1jZB5w==
X-Google-Smtp-Source: AA0mqf6FDuUQ7oa2sK/OhFmCAUSB/DBnyAam5tNbnNb+uAHO0524fMqAUn+O+NGJ3cxGm0IrsquNlA==
X-Received: by 2002:a05:6870:8183:b0:137:5344:7776 with SMTP id k3-20020a056870818300b0013753447776mr31801448oae.208.1669764518884;
        Tue, 29 Nov 2022 15:28:38 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id w12-20020a056830410c00b006619295af60sm15421ott.70.2022.11.29.15.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 15:28:38 -0800 (PST)
Received: (nullmailer pid 492448 invoked by uid 1000);
	Tue, 29 Nov 2022 23:28:37 -0000
Date: Tue, 29 Nov 2022 17:28:37 -0600
From: Rob Herring <robh@kernel.org>
To: Hector Martin <marcan@marcan.st>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Ulf Hansson <ulf.hansson@linaro.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Stephen Boyd <sboyd@kernel.org>, Marc Zyngier <maz@kernel.org>, Mark Kettenis <mark.kettenis@xs4all.nl>, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v5 2/4] dt-bindings: cpufreq: apple,soc-cpufreq: Add
 binding for Apple SoC cpufreq
Message-ID: <20221129232837.GA432535-robh@kernel.org>
References: <20221128142912.16022-1-marcan@marcan.st>
 <20221128142912.16022-3-marcan@marcan.st>
 <CAPDyKFobMvef_BWGMR=7avODh2r5XNMGpwO3xYgrN-u=DqRwbg@mail.gmail.com>
 <41c6882a-bff0-378c-edd3-160b54be7c1d@marcan.st>
 <a297079e-2dc9-d311-5415-a58332e7a711@linaro.org>
 <e8c481ba-02a7-f1c7-6314-ea1ddf136998@marcan.st>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8c481ba-02a7-f1c7-6314-ea1ddf136998@marcan.st>

On Wed, Nov 30, 2022 at 12:17:08AM +0900, Hector Martin wrote:
> On 29/11/2022 23.34, Krzysztof Kozlowski wrote:
> > On 29/11/2022 15:00, Hector Martin wrote:
> >> On 29/11/2022 20.36, Ulf Hansson wrote:
> >> Please, let's introspect about this for a moment. Something is deeply
> >> broken if people with 25+ years being an arch maintainer can't get a
> > 
> > If arch maintainer sends patches which does not build (make
> > dt_binding_check), then what do you exactly expect? Accept them just
> > because it is 25+ years of experience or a maintainer? So we have
> > difference processes - for beginners code should compile. For
> > experienced people, it does not have to build because otherwise they
> > will get discouraged?
> 
> I expect the process to not be so confusing and frustrating that a
> maintainer with 25+ years of experience gives up. That the bindings
> didn't pass the checker is besides the point. People say the Linux
> kernel community is hostile to newbies. This issue proves it's not just
> newbies, the process is failing even experienced folks.

IME, a lack of response is a bigger issue and more frustrating.

> On that specific issue, any other functional open source project would
> have the binding checks be a CI bot, with a friendly message telling you
> what to do to fix it, and it would re-run when you push to the PR again,
> which is a *much* lower friction action than sending a whole new patch
> series out for review via email (if you don't agree with this, then
> you're not the average contributor - the Linux kernel is by far the
> scariest major open source project to contribute to, and I think most
> people would agree with me on that).

We could probably add a $ci_provider job description to do that. In 
fact, I did try that once[1]. The challenge would be what to run if 
there's multiple maintainers doing something. Otherwise, it's a 
maintainer creating their own thing which we have too much of already.

> I know Rob has a DT checker bot, but its error output is practically
> line noise,

I'm not sure what to do there beyond the 'hint' lines I've added. It's 
kind of how json-schema functions unfortunately. I think it stems from 
each schema keyword being evaluated independently.

>  and the error email doesn't even mention the
> DT_SCHEMA_FILES= make option (which is the only way to make the check
> not take *forever* to run).

That's easy enough to add and a specific suggestion I can act on.

However, note that the full thing still has to be run because any 
schema change can affect any other example (which is a large part of 
why it's slow).

>  Absolutely nobody is going to look at those
> emails without already knowing the intricacies of DT bindings and the
> checker and not find them incredibly frustrating.

I don't know how else to enable someone not understanding DT bindings 
nor json-schema to write DT bindings. I get that json-schema is not 
something kernel developers typically know already. Trust me, the 
alternatives proposed for a schema over the years would have been 
much worse.

Rob

[1] https://lore.kernel.org/all/20181003222715.28667-1-robh@kernel.org/

