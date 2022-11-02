Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38D36D18
	for <asahi@lists.linux.dev>; Wed,  2 Nov 2022 15:58:12 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id d3so25675155ljl.1
        for <asahi@lists.linux.dev>; Wed, 02 Nov 2022 08:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vxrpJJ0/0vnVYdAZjE38mJeVD3TgThnRraSG3AuzU+E=;
        b=MGwWCwMTVi8h/OuAkw2JkJ2WSaW6A4X9ZAQXUnCDCfN7fs+SNrAo9vCsUwRJ9ozebK
         coZQuFNSG4u1WQzIoeQxL8vd0rS/PmXrey49+pBPVSs+iEffvKwz0clU37UIMdAPIBS4
         cYxFn4h35MK/yMwWJG37k++17NxGKbnT8ueDsV/+xOoGWkLB8yfKbpod2skcTJpTBQji
         jFAUakAe40UgEH0hvBeFvvROiJpCp+cXo9eevyPR8Cf0+kf4MEa3ouqNVc1039O4dZPX
         tymeAA4ODop9+tmVb+IqL9gPk4sdPa3DTSytO2GphAGM67YMmO9RpcGQPtdOD8+lB16M
         xYGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vxrpJJ0/0vnVYdAZjE38mJeVD3TgThnRraSG3AuzU+E=;
        b=LWrRVE8ve4uaqvnNpYZW0YbIxVFZQbooLwve5uEC5SN/ObZAwHrh4J58u2S2qHVeXd
         /mTjiD6dMa+imsT0a85Ot4lu+scjQJhy8Q4F0gn5y3qltHn8Ghn0nr02LG+btx0xtvE/
         MtBDylCFO92vFxwoaqxel7Fj9TXxxNjsKaojz/eBE8PfXn8/QaXDj1EufwmrSmB52pAZ
         xVSwqBB8CxrYalqha7iuVbnUCn1B5Lo+GwCpeKxwhGkLqPUMuWBkYC375e26s6whC5WV
         6hDb8uJh9QLueQlrPjJAoKAVkXlnnB7ytLlWzGEvZKeXR97jJQbCIfLdDbDxlta8DnnX
         y8/Q==
X-Gm-Message-State: ACrzQf1LdJ125cCbuOEYoqLvc0MOIsLZ2YgUHcr7ci+b7+1kiBzrsmkR
	F1HMaYA/t2bK8R/ZUgmOwfq/JkJC3jGkbyWpOds=
X-Google-Smtp-Source: AMsMyM60gGchkEkwbirb8r1GfQPxQal/ndKoAXVepiKC0Yw/FUgLWjK1pSoep9a8s2ddsmH1W+2WWacIUvHNV3W188w=
X-Received: by 2002:a2e:834b:0:b0:26d:e1f8:1453 with SMTP id
 l11-20020a2e834b000000b0026de1f81453mr8946318ljh.65.1667404690835; Wed, 02
 Nov 2022 08:58:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221102141513.49289-1-fnkl.kernel@gmail.com> <20221102141513.49289-3-fnkl.kernel@gmail.com>
 <OS0PR01MB59227A9E7B8A471E4D6B665786399@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB59227A9E7B8A471E4D6B665786399@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Wed, 2 Nov 2022 18:57:59 +0300
Message-ID: <CAMT+MTT1ptFymwDdOe=OXYzKfOPHdQbAfpx_9LBYn+C9NFhddg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] pwm: Add Apple PWM controller
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, 
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, "marcan@marcan.st" <marcan@marcan.st>, 
	"sven@svenpeter.dev" <sven@svenpeter.dev>, "alyssa@rosenzweig.io" <alyssa@rosenzweig.io>, 
	"asahi@lists.linux.dev" <asahi@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Nov 2022 at 18:33, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > +     clk = devm_clk_get_enabled(&pdev->dev, NULL);
> > +     if (IS_ERR(clk))
> > +             return PTR_ERR(clk);
>
> What is your use case?
>
> PWM is configured by bootloader intially??
>
> Or
>
> PWM is configured by Linux not by the bootloader?
>
> Or
>
> Driver needs to support both ??

The PWM device itself is configured by linux, but the clock it uses is
the systemwide 24 MHz clock, and that is configured by platform
firmware.
