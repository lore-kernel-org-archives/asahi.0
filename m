Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944CB2F24
	for <asahi@lists.linux.dev>; Tue, 14 Feb 2023 18:52:40 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id v23so17986368plo.1
        for <asahi@lists.linux.dev>; Tue, 14 Feb 2023 10:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eGALdumedzj5vEn2J6uPvtN959aI7mKYbul3DxbZlL4=;
        b=GxGxY/VVoZXbA/e+6YZKXcyDG96LtKIyKpAXn6sVNQMowXf9Y/rsmEVQ9RJngDfmdb
         3ZWraiTJmNCBHmhVEkTDqIke/jKt2v/BkHFEzLLq9cHJmRrbM1Iy6IU9nDuH0gXbnblX
         XVj54sJd3TPEk3Qwr3pfBj6FiRqXb/JreX1SH86uBGYxLIb6C66r3v2hRUDGT9FTc+So
         1dztbjeNMTFP0JuXZzVqunB1yQMxj3n8/rKbFqvqur8gioRIjXInSQ9fAS0GOP08b4/Q
         7oS9PXyXqTRMPlqy2NzMys01FH21wH/82Ud31RSM3T0zAA26qByGblq8D5rd8b98MO1w
         uAAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eGALdumedzj5vEn2J6uPvtN959aI7mKYbul3DxbZlL4=;
        b=xHvJKK/H/FmTKtIaqKuGBGJaYs13Xd3HQLGl349niLTb5BmUFzeXsoYHfHPLFOIW91
         V6igYsm/XwfpKdN/lGCp7qi4h+euRR59fUyxSFe0j1ogFQDZ5ZWhVLTL/kAVvgiWq2QG
         nu0eFz7AkrURTenPiKn6FoOlNr9qJp95T7s+JbSCmLgh18yM0vJ6TrsfsIqi2f1KO4T7
         5Ktk3VLe1uCcsXG+XuLCzHviCFs4SdQ/ceQlF1u6L1dwjlSqLNCbVRRgWlV5mKnttT+C
         lNWb1gfGfjK/IAyL1iYlnUk5EqHpYfoUm66N0zvAfBJQ2kq7kOl2q8/GE8QpGa6zYe87
         oKMA==
X-Gm-Message-State: AO0yUKVoNE6/uDbh2l3nssI7qb3//Fnwb/EnxOP8B2JLSvIfEuUj2Zcs
	m7NJUirfyfc3/9WUNxx59g4=
X-Google-Smtp-Source: AK7set/NN5Mqq/S3cCp1vINmL+OJbGqBYnA/vxuU2c1uwc8zNhDxHLZrmkVL4jLeuk3qYr3nWKv8Gw==
X-Received: by 2002:a05:6a20:8f05:b0:be:a604:c683 with SMTP id b5-20020a056a208f0500b000bea604c683mr3935807pzk.45.1676400760002;
        Tue, 14 Feb 2023 10:52:40 -0800 (PST)
Received: from kazuki-mac ([2400:4051:ea3:5910::19a])
        by smtp.gmail.com with ESMTPSA id f18-20020aa78b12000000b0059312530b54sm10069849pfd.180.2023.02.14.10.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 10:52:39 -0800 (PST)
From: Kazuki <kazukih0205@gmail.com>
X-Google-Original-From: Kazuki <kazuki@kazuki-mac>
Date: Wed, 15 Feb 2023 03:52:34 +0900
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Tudor Ambarus <tudor.ambarus@microchip.com>,
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
	Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
	linux-kernel@vger.kernel.org, Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH v2 0/3] SPI core CS delay fixes and additions
Message-ID: <20230214185234.uj63aovylzixs6xa@kazuki-mac>
References: <20230113102309.18308-1-marcan@marcan.st>
 <167362544665.163457.10878671229075890152.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <167362544665.163457.10878671229075890152.b4-ty@kernel.org>

On Fri, Jan 13, 2023 at 03:57:26PM +0000, Mark Brown wrote:
> On Fri, 13 Jan 2023 19:23:07 +0900, Hector Martin wrote:
> > Commits f6c911f3308c ("spi: dt-bindings: Introduce
> > spi-cs-setup-ns property") and 33a2fde5f77b ("spi: Introduce
> > spi-cs-setup-ns property") introduced a new property to represent the
> > CS setup delay in the device tree, but they have some issues:
> > 
> > - The property is only parsed as a 16-bit integer number of nanoseconds,
> >   which limits the maximum value to ~65us. This is not a reasonable
> >   upper limit, as some devices might need a lot more.
> > - The property name is inconsistent with other delay properties, which
> >   use a "*-delay-ns" naming scheme.
> > - Only the setup delay is introduced, but not the related hold and
> >   inactive delay times.
> > 
> > [...]
> 
> Applied to
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
> 
> Thanks!
> 
> [1/3] spi: Use a 32-bit DT property for spi-cs-setup-delay-ns
>       commit: f276aacf5d2f7fb57e400db44c807ea3b9525fd6
Hi,

Shouldn't this be sent to 6.2 before the property becomes a stable ABI?

Thanks,
Kazuki
>
