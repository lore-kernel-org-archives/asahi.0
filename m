Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759943C1E
	for <asahi@lists.linux.dev>; Wed, 15 Feb 2023 10:13:14 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-52eb7a5275aso246107227b3.2
        for <asahi@lists.linux.dev>; Wed, 15 Feb 2023 02:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TChxARwnI0lpB/SBhETxB4OwsG83QsJzGDQ5SFDuIHI=;
        b=YnA5Um2G6jRmV2vPq6yTc+f3qCg8bJxLYu0M00iWtnL85aZ5NMUQcFoyvhlq5xVscT
         g/FxUgYK3nZrVcqBMq01M0/gGCKbOcbXgv+qqiMKM/kmW6c5tLNSuRBtBO9NPrV4Dfkv
         qtu2/GRfCCRqXIATR7QzjRsD0Udxh40USkDw1qXVoGrxYLj6rdex8MJ2vBOB1nVQJjFh
         4RrFqcGYGrg5mGbLsRrkcsByOUuuDgqUE/L4bvrtcAY4mgNI66TjQXZSEcYGZW/EnCTb
         Y9BPKr7dM7+ATFt1rVGWp9ZKCZMoQE2mKcGNRyRAMI+koTTOIYDIWr6kGg2PWrFmXKrs
         cU/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TChxARwnI0lpB/SBhETxB4OwsG83QsJzGDQ5SFDuIHI=;
        b=otDyIH7BagkBVHz0yI8Aa5MBv6qFGnpW0shzvVdOYJkBK0Ecahom2NR44EjuedRdQk
         xH4ulwXETRXj6T23LuY3IwVQ6TG9QO5E0ASEXD6o/MRxqkcL3A8RL0eSqsuQNTKIQaXJ
         s4VUd1xuMEy902+/TpEq/mf5z5Xj0ycY4iNowcwriOsHa+Zz1iSRnJNQX2REUvcOUHF/
         oStNED12+J0D/c3YHdBs5f+A+3LHJA0U/w4j1InvJO/yfMa5R+GYMfa+5Maf76ezXRnt
         tPZIZGeZYUw7pk8OqcYAe1FKKVIIHsVusJ+8ucF2jzhqWv5n5xvqi+s1F1Elv3FNeUuC
         dzRg==
X-Gm-Message-State: AO0yUKV6VER91NNCerpiUiLD47PPqtU/w564PUvY0tmREon1NDXA/1Ga
	NRzhpRRcf+ZlFfJ93D0LS9SpcV6e9IK7LIlgbIn8Aw==
X-Google-Smtp-Source: AK7set/ERxZzW3KNVrEUjAzdskHBB0Sb13W2voFJQCEl0GcMl9AuDWEND5R+eHJNT6p08hYHRxzc2W9S3PJRV7hbj7k=
X-Received: by 2002:a81:a103:0:b0:52e:b3df:cae4 with SMTP id
 y3-20020a81a103000000b0052eb3dfcae4mr144282ywg.128.1676455993332; Wed, 15 Feb
 2023 02:13:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230214080034.3828-1-marcan@marcan.st> <20230214080034.3828-2-marcan@marcan.st>
In-Reply-To: <20230214080034.3828-2-marcan@marcan.st>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 15 Feb 2023 11:13:01 +0100
Message-ID: <CACRpkdaeuUuKow2AZPi66gFpDVBB0kqvFJAJNmWB7Mn5gtDG7g@mail.gmail.com>
Subject: Re: [PATCH 1/2] brcmfmac: acpi: Add support for fetching Apple ACPI properties
To: Hector Martin <marcan@marcan.st>
Cc: Arend van Spriel <aspriel@gmail.com>, Franky Lin <franky.lin@broadcom.com>, 
	Hante Meuleman <hante.meuleman@broadcom.com>, Kalle Valo <kvalo@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev, 
	linux-wireless@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com, 
	SHA-cyfmac-dev-list@infineon.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 14, 2023 at 9:01 AM Hector Martin <marcan@marcan.st> wrote:

> On DT platforms, the module-instance and antenna-sku-info properties
> are passed in the DT. On ACPI platforms, module-instance is passed via
> the analogous Apple device property mechanism, while the antenna SKU
> info is instead obtained via an ACPI method that grabs it from
> non-volatile storage.
>
> Add support for this, to allow proper firmware selection on Apple
> platforms.
>
> Signed-off-by: Hector Martin <marcan@marcan.st>

It looks like a horrible Apple-ism but I don't know much about ACPI.

The ACPI people are working on device properties to abstract away
all device properties no matter if they come from ACPI, device tree or,
ehm Apple-ACPI, but for now I think it is more important to get
this hardware working upstream and we can think about refactoring
this into device properties for the longer term.

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
