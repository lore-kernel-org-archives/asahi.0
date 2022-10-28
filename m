Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7424ABA41
	for <asahi@lists.linux.dev>; Fri, 28 Oct 2022 18:45:11 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id d25so9264853lfb.7
        for <asahi@lists.linux.dev>; Fri, 28 Oct 2022 11:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7q2OB//2hf9lUeahKYT3i6qbY00fQQMbGM4w7OVkbIc=;
        b=SZ4XUKfHaI8T1FxSok6Z79YUgsNwcY4xaw8GBd+tmIKFvz9cR0JakKPt5noszTQogG
         SvNurd1sq9s7aFjHA4RkFb258YmUKz3iAzkj7Op8smoGJYCypubBH3+0M1iNCsLZ5gs1
         s6ztwuy8Q2mAYiBJBOh5iGo4/8qW7I/TCpmV0SqPtViWdwkYEopdML+Ip13R/QzQSz8U
         JFl47XXlwkM46RVraBjtSdiTJ2YhcXINjoAD8Ae7MDJmgkslMVS9s0+QmjB34bGNVpm9
         E9hsyYzyY/bQuufjtEGfNe0UxJ2hWSiy4MILr63AOY2qKLrpS2gzzYJeL4GzZcDsv4wj
         0//w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7q2OB//2hf9lUeahKYT3i6qbY00fQQMbGM4w7OVkbIc=;
        b=2ZjvqjeJzQzru0wDRJiU9qt6ceHANN10nTaghUiqJ5m4+TS0vxQsgJxVoL3r4UlNNP
         Ck60FTmCPzYBgHEnFePdxYGY0qsC3i9T8FurB2QD1lIu8eQKef8bhLnA5vrFQDPgTFB8
         7IpJuktIMQxhWN21+b9Yj6gIx8yZDdIOpqJJsTv+x63k4ytN75b6pAOMBrXe5Ip8VkND
         cJ6Sdl9ZvjC+j0jgxx+Ppu32wzun+NhgRKZj8wxVNG7q4MdFS26tB3dQcfoL5gBtz13A
         edks+KVDACQtwbKjCcjuXs9bLSxDm/kaXbgl5HS1aLeo+eAuBB90XOaenM30Mbas/QjW
         Rowg==
X-Gm-Message-State: ACrzQf14fOYdOsa7u6u8VWyd9Q2fn+CW41wlG6mkB8584VjshdVB652q
	RoAz9oE0ceOAqcz55qTmECPJ9xdtw4vxIkLOOno=
X-Google-Smtp-Source: AMsMyM5hB5vHw5irh4m8H9U/NidFo6WSQwcEdaHTHBns4LI10bhMMEbZU1JhOWV8M3vUd26wJDIWIDSuTeeyFXEcBRY=
X-Received: by 2002:a05:6512:75:b0:4a4:6c3e:a75d with SMTP id
 i21-20020a056512007500b004a46c3ea75dmr256491lfo.408.1666982709426; Fri, 28
 Oct 2022 11:45:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221028165215.43662-1-fnkl.kernel@gmail.com> <20221028165215.43662-2-fnkl.kernel@gmail.com>
 <5b194c93-48df-055a-f532-abd98657dc41@linaro.org>
In-Reply-To: <5b194c93-48df-055a-f532-abd98657dc41@linaro.org>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Fri, 28 Oct 2022 21:44:57 +0300
Message-ID: <CAMT+MTQAe_eKoiNvmL4fje0__V16VDFWDGzehkN6M-jRuuMn7A@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: pwm: Add Apple PWM controller
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: thierry.reding@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, marcan@marcan.st, sven@svenpeter.dev, 
	alyssa@rosenzweig.io, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 28 Oct 2022 at 20:53, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 28/10/2022 12:52, Sasha Finkelstein wrote:
> > +  PWM controller used for keyboard backlight on ARM Macs
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - apple,t8103-fpwm
> > +          - apple,t6000-fpwm
> > +          - apple,t8112-fpwm
> > +      - const: apple,s5l-fpwm
>
> Is it then derived from Samsung platform? If yes, it is candidate for
> merging.
Apple calls it the 'AppleS5L8920XFPWM' which suggests some samsung
lineage, but the register interface is different from the one in
pwm-samsung driver.
