Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD17320F
	for <asahi@lists.linux.dev>; Mon, 22 Aug 2022 18:59:28 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id br15-20020a056830390f00b0061c9d73b8bdso8317267otb.6
        for <asahi@lists.linux.dev>; Mon, 22 Aug 2022 11:59:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc;
        bh=KC3mSExT2980nvsUpi0Nta2kzUEej10EfwvbkK4Vxig=;
        b=jwriOE6zdmBvS2u/Z2SBXdPFlvstOV5o3a216TawIglxPHIv9+UkmM9OHNSDavA5OB
         pzj2+HXeOuvf2sr3ZcwJwf7s8XFDnga+xxxMruU7pmi+HIeMf70EHRCLL1xvt7yhzd/V
         vbSM7ehk3WzBNfJR1ZK+AJ8p4ZkHRzVD5bld/74KNSvgVFV6tnZdd4ja4I+3rW/ltvoO
         5U7DzXh7T7XcT7HZPlEYjCrE7CY2h62rNncxywVw3iqTPpV4tTVvYIX2YNYln2b9TY+H
         /VIjn8Fi3XhZmHpzmBCxh96pgKvQZVM9LJoGCUVzcLn3mLHAZLxolU0LdIYqXkrs6XAe
         Kefg==
X-Gm-Message-State: ACgBeo0AfzQ3iI3uAOr2hmIMdLUVPOBnczT7eBSkLegRtuSJx4rsSe39
	d3CYD3+V7o6qneZkVGTSxw==
X-Google-Smtp-Source: AA6agR7btQFmvQq0Xy9/DuWu4SwhzJqPzpfHfJhyCbe3cPr8MjiKVjCR+AbUoPv1GGenu7V4Fr40aw==
X-Received: by 2002:a05:6830:19a:b0:636:dbfe:4c36 with SMTP id q26-20020a056830019a00b00636dbfe4c36mr8070226ota.257.1661194767772;
        Mon, 22 Aug 2022 11:59:27 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id z24-20020a4a8e58000000b004357ccfc8bfsm2633078ook.7.2022.08.22.11.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 11:59:27 -0700 (PDT)
Received: (nullmailer pid 170179 invoked by uid 1000);
	Mon, 22 Aug 2022 18:59:26 -0000
Date: Mon, 22 Aug 2022 13:59:26 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, Philipp Zabel <p.zabel@pengutronix.de>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: sound: Add Apple MCA I2S transceiver
Message-ID: <20220822185926.GA146730-robh@kernel.org>
References: <20220819125430.4920-1-povik+lin@cutebit.org>
 <20220819125430.4920-2-povik+lin@cutebit.org>
 <AE646B68-CA14-483C-A1AB-30358560DAAD@cutebit.org>
 <8472463e-d99a-d0f6-9551-45a79a15f567@linaro.org>
 <737767DD-CB70-4941-8CF5-497333D3A801@cutebit.org>
 <a0a34ac8-4b62-4e69-f16f-7a51132a3987@linaro.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a0a34ac8-4b62-4e69-f16f-7a51132a3987@linaro.org>

On Fri, Aug 19, 2022 at 05:17:17PM +0300, Krzysztof Kozlowski wrote:
> On 19/08/2022 17:14, Martin Povišer wrote:
> >>> Since it was brought up last time but I didn’t respond: the
> >>> nonalphabetical order is as the chips were introduced (and
> >>> matches other schemas).
> >>
> >> Sure, just keep that order for future compatibles as well - so always
> >> put them according to verifiable time of market introduction...
> >>
> >> This is very poor reason, instead of alphabetical order. Even worse
> >> reason is repeating wrong pattern just because someone else did it.
> >>
> >> Best regards,
> >> Krzysztof
> >>
> > 
> > I don’t see it nearly as clear-cut. Adding to the end seems pretty
> > foolproof too, but OK, next submission will have it alphabet. ordered.
> 
> The concept is the same everywhere, be it Kconfig, Makefile or other
> lists. If everyone adds at the end, you increase the chances of
> conflicts. Having alphabetical order usually means simultaneous edits
> will happen in different places.

The difference for those cases is there is 0 control of when things are 
added with the source being all independent (different companies). For 
these, it's all one platform family and there's limits as to when one 
source can produce new entries.

I'd kind of like to know timeline order, but alphabetical is the only 
thing we can ever check easily and possibly automate (hint). 

Rob
