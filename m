Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A41528E1
	for <asahi@lists.linux.dev>; Mon, 27 Feb 2023 22:14:28 +0000 (UTC)
Received: by mail-oo1-f50.google.com with SMTP id p8-20020a4a3c48000000b0052527a9d5f0so1251219oof.1
        for <asahi@lists.linux.dev>; Mon, 27 Feb 2023 14:14:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZS2bF3+Kst9y6aMOuXBKptVY4beKNpQcXiRFClTf/bI=;
        b=iS2qJHH31UnBhp2NiEDz/KUGKYAxxk08OcD8v66ZkYQBCyVJKUYGk7a7VwPNcOpm30
         kb7hkrnaOFMjpug0QY2rbMTjpij7J1wfdNGXRxIiisvGySFp+7w2XqJ0hV7HCXCufhAd
         TcKKzs0xzmdpxiW2hnN4zkSyr8i80lw7fX6Y/PSiAvMMNV+jvSFKltcsDL/VXOb8Sh6Y
         pvcbQ1v3TOUaYmbo5bI7jH+LABRz7YtiC51Y3Yf3qZ/mbG7vZU2BqcCbCBmR354n85pQ
         82nqkklRZiTU5h1MLcReDo4Dl77CbSFxMKWDmIakgTn98dW+sDIpymNbAjJ4bqbihE0K
         K1Xw==
X-Gm-Message-State: AO0yUKWAeKDXALoiNWY65pU81xCHuLhLx6+jbh6FLNBE7ipe9LmoLbls
	xjkU/Jkjbi2XFGNCGdHnWg==
X-Google-Smtp-Source: AK7set9a9wt8dYLW0+D9GTxaOE63A+at2SMod+AKLVoJqf5EzvyD9tdF199K0X72Q60jeiCDGB6/0A==
X-Received: by 2002:a4a:6b12:0:b0:4f2:8f8:d2ff with SMTP id g18-20020a4a6b12000000b004f208f8d2ffmr70403ooc.6.1677536067377;
        Mon, 27 Feb 2023 14:14:27 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id k22-20020a056820017600b00517a7ac36c8sm3124614ood.24.2023.02.27.14.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 14:14:27 -0800 (PST)
Received: (nullmailer pid 1193336 invoked by uid 1000);
	Mon, 27 Feb 2023 22:14:26 -0000
Date: Mon, 27 Feb 2023 16:14:26 -0600
From: Rob Herring <robh@kernel.org>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, - <asahi@lists.linux.dev>, Henrik Rydberg <rydberg@bitmath.org>, linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 1/4] dt-bindings: input: touchscreen: Add Z2
 controller bindings.
Message-ID: <20230227221426.GA1048218-robh@kernel.org>
References: <20230223-z2-for-ml-v1-0-028f2b85dc15@gmail.com>
 <20230223-z2-for-ml-v1-1-028f2b85dc15@gmail.com>
 <20230227195139.GA677578-robh@kernel.org>
 <CAMT+MTRodB_+sMtoPxv-gP_+sJAwNb36XuLOGo=HvuCQq6h+gQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMT+MTRodB_+sMtoPxv-gP_+sJAwNb36XuLOGo=HvuCQq6h+gQ@mail.gmail.com>

On Mon, Feb 27, 2023 at 09:06:28PM +0100, Sasha Finkelstein wrote:
> On Mon, 27 Feb 2023 at 20:51, Rob Herring <robh@kernel.org> wrote:
> >
> > > +properties:
> > > +  compatible:
> > > +    const: apple,z2-touchscreen
> >
> > Is 'z2' anything other than a touchscreen? If not, '-touchscreen' is
> > redundant. If so, then what else is there? You should be describing
> > physical devices, not just a protocol for touchscreen.
> >
> 
> This is a class of touchscreen controllers that talk the z2 protocol
> over spi.

Yes, you already said that much. So nothing else for this piece of h/w? 
Then 'apple,z2' is sufficient. Well maybe. You are assuming all h/w in 
the world speaking 'z2' is the same (to software). Usually that's not a 
safe assumption, but maybe Apple is better at not changing the h/w...

Normally, the 'protocol' to talk to a device is only part of it. There's 
other pieces like how to turn the device on and off which need h/w 
specific knowledge. If you need any of that, then you need specific 
compatibles. Adding properties for each variation doesn't end up well.


> 
> > > +                    touchscreen-size-y = <640>;
> > > +                    apple,z2-device-name = "MacBookPro17,1 Touch Bar";
> >
> > Why do we need this string? If you want a human consumed label for
> > some identification, we have a property for that purpose. It's called
> > 'label'. But when there is only 1 instance, I don't really see the
> > point.
> 
> I want a libinput-consumed label to distinguish between devices
> using this protocol. 

I know little about libinput, but how would it know about 
'apple,z2-device-name'?

> It is used both for 'normal' touchscreens, and,
> as is in this example a 'touchbar', which absolutely should not be
> treated as a normal touchscreen, and needs special handling in
> userspace.

Meaning there are both touchscreens and touchbars using this? That 
sounds like s/w needs this information. From a DT perspective, 
'compatible' is how DT defines exactly what the h/w is and how to use 
it. That also doesn't sound like a unique issue. Doesn't the kernel 
provide a standard way to tell userspace what's a touchscreen vs. 
touchpad vs. ???

Rob

