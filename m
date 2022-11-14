Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3031FBE
	for <asahi@lists.linux.dev>; Mon, 14 Nov 2022 08:26:38 +0000 (UTC)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-13ae8117023so11722806fac.9
        for <asahi@lists.linux.dev>; Mon, 14 Nov 2022 00:26:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1f6hcexQwRSjpPtI2b6I+pAA5eVX0oLT0ZXtJfpdDAY=;
        b=rcDaONsr9cpgSJizCyCq6d/fzlgU+JFmTnNHe/4KAD34CWqlIumIL5MVqImbCzqtNk
         CMEKBKSKTaKH5f1eGm35x9fLN/E8DNi+gvibwt4hGIt8pJ9debIacxQSDS+1OaEWlj2q
         RAXOKDZRs9XLBM6yO0KbJ0mMAdksWIQOQmjOlzFKX6ykGX83u92wo10SeeoBiEjmS6Di
         ZEK+G8fYy49lhdnD4kjvzgiPXrXeDoQZPdZDHZJG1Ayjjqc0WYON25py7ZyX1AAs4nhm
         sz7E9MfQtDscW/iVsL4mBmejo477GemmAj9bMlt+yklI/am4ljhUXpejh342KIBRIv6+
         DmOw==
X-Gm-Message-State: ANoB5pncHQrlsuIMUDVHjmiQmxYK4ggbq0eB8nTnqvETjY4YFwVre79o
	nDnQUPzMYQLlbm5M5GHbUAdDHeAjhxL/3Q==
X-Google-Smtp-Source: AA0mqf65bmiXgb1Dqf6So2jW2ZCxq4kj6flBHkW/hiDTyFN/fh+J+eTE9H6WduZSVfw4OJZfuWM7QA==
X-Received: by 2002:a05:6870:1d0a:b0:132:f7b8:3f27 with SMTP id pa10-20020a0568701d0a00b00132f7b83f27mr6129541oab.116.1668414397915;
        Mon, 14 Nov 2022 00:26:37 -0800 (PST)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com. [209.85.161.41])
        by smtp.gmail.com with ESMTPSA id be28-20020a056870589c00b0013b09a56d59sm4635560oab.27.2022.11.14.00.26.37
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Nov 2022 00:26:37 -0800 (PST)
Received: by mail-oo1-f41.google.com with SMTP id x196-20020a4a41cd000000b0049f064d2591so1477582ooa.11
        for <asahi@lists.linux.dev>; Mon, 14 Nov 2022 00:26:37 -0800 (PST)
X-Received: by 2002:a25:cb4a:0:b0:6dd:b521:a8f2 with SMTP id
 b71-20020a25cb4a000000b006ddb521a8f2mr11133712ybg.380.1668413975373; Mon, 14
 Nov 2022 00:19:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221111212857.4104308-1-robh@kernel.org>
In-Reply-To: <20221111212857.4104308-1-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Nov 2022 09:19:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXT_+_afxBW6=dku+Y1ea8GTaWznM5vzXO7bYQ1Z8sRwQ@mail.gmail.com>
Message-ID: <CAMuHMdXT_+_afxBW6=dku+Y1ea8GTaWznM5vzXO7bYQ1Z8sRwQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Drop type from 'cpus' property
To: Rob Herring <robh@kernel.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@somainline.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Robin Murphy <robin.murphy@arm.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Thara Gopinath <thara.gopinath@linaro.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 11, 2022 at 10:29 PM Rob Herring <robh@kernel.org> wrote:
> 'cpus' is a common property, and it is now defined in dtschema schemas,
> so drop the type references in the tree.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

>  Documentation/devicetree/bindings/power/renesas,apmu.yaml   | 6 ++----

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
