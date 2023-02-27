Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9331C28E1
	for <asahi@lists.linux.dev>; Mon, 27 Feb 2023 22:23:11 +0000 (UTC)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-172094e10e3so8987635fac.10
        for <asahi@lists.linux.dev>; Mon, 27 Feb 2023 14:23:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IGidbQmDp0y8QHK1i8MQiE3zuAGUVCeiQUrW3n/jLQA=;
        b=WOZP6qOV5ynww1dqLJVPrCXrXWETACwpITkr2KkBgJwa7UJd6Mbj6a7E9a7B79fx3P
         fpY2zmj6LjKCBXpomQhk9bVlOo0mOiflTWdvlWdt7R+8xxSy+h+CcF+N8VW+veyYyT51
         flNICoKQOFGSLEcnSj7vJfUeHh5XYmw5On2qDvFa/DjIfJ6mnDS7lhnrASd8Q3MbwBy+
         cJe5JKRjTdQFhuUogms7WE5udKfsROCn957M5EL0IJV2VWrqsaX3zzIjOtNj05DTctly
         atz87H6EUIPXNMpokNpx3nDViBJfk8cOiwnIQJGPez508F+uHd1w03VfLxtUg4VkXbzU
         IOxQ==
X-Gm-Message-State: AO0yUKWt3kux2TZqmjHProcmoe8guFR5Es255uvvVIMiuY5DJlz8ryzV
	kMUG02aX1I1dPiwX7jGi6Q==
X-Google-Smtp-Source: AK7set/Usgaz2hjzp8Gr6Ihin9hinyRkpzjsT99cLWKoo13twDWuN7/AAI9t8LMvnbIpKemlE0N/Pw==
X-Received: by 2002:a05:6870:588a:b0:16d:ba05:23a7 with SMTP id be10-20020a056870588a00b0016dba0523a7mr232309oab.26.1677536590586;
        Mon, 27 Feb 2023 14:23:10 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 66-20020a9d04c8000000b0068663820588sm3170854otm.44.2023.02.27.14.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 14:23:10 -0800 (PST)
Received: (nullmailer pid 1207434 invoked by uid 1000);
	Mon, 27 Feb 2023 22:23:09 -0000
Date: Mon, 27 Feb 2023 16:23:09 -0600
From: Rob Herring <robh@kernel.org>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Sven Peter <sven@svenpeter.dev>, Hector Martin <marcan@marcan.st>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, - <asahi@lists.linux.dev>, Henrik Rydberg <rydberg@bitmath.org>, linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 1/4] dt-bindings: input: touchscreen: Add Z2
 controller bindings.
Message-ID: <20230227222309.GB1048218-robh@kernel.org>
References: <20230223-z2-for-ml-v1-0-028f2b85dc15@gmail.com>
 <20230223-z2-for-ml-v1-1-028f2b85dc15@gmail.com>
 <e26318db-77b1-4876-8a40-f707d11b5857@app.fastmail.com>
 <CAMT+MTQ0bZiGpEFK9w3zncB-ZcCLY_tp1d5Wc0MJUMjWqc61jA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMT+MTQ0bZiGpEFK9w3zncB-ZcCLY_tp1d5Wc0MJUMjWqc61jA@mail.gmail.com>

On Fri, Feb 24, 2023 at 12:08:42PM +0100, Sasha Finkelstein wrote:
> On Fri, 24 Feb 2023 at 12:04, Sven Peter <sven@svenpeter.dev> wrote:
> > Now that I thought about this again after the brief discussion we already had:
> > Do we even need to specify the device name? Is there any reason we can't just
> > always use something like "Apple Z2 TouchBar"?
> A similar protocol is used for primary touchscreen on idevices, which

Similar? So close, but somehow different.

> need different
> userspace handling. This is to make the driver potentially useful for
> people who run
> linux on checkra1n-able devices.

It is sounding to me like you need different compatibles. Don't try to 
parameterize the differences with properties. Unless you can define all 
the differences up front (hint: you can't).

Rob
