Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631498479
	for <asahi@lists.linux.dev>; Mon, 23 Jan 2023 17:53:41 +0000 (UTC)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-15fe106c7c7so8724878fac.8
        for <asahi@lists.linux.dev>; Mon, 23 Jan 2023 09:53:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HezRXXIQxXPtMIWpEGs9XWajQCD0kCzEdwMP0szra1Y=;
        b=GcLxbIIzO33pNI/kEP568g1PrbewlfsvnMU6HzP4q47rWpjuiWPM/IKNNPpnPo+CWC
         P4cNQ8LFUxM8NMuxf0NLVUZGkeKlD80I4Lv5DfNsYfVd5qCIrXFlH3+WcciDh+wnIMMn
         37eYmBnKkQCplH/qM7nwZ8HDSzgSRXxuvamC1lLfNi0DTH41v72n6ZAiwWbjtTNAP2Xh
         jhVO6U+BC+d6J0phk9q9nr/qfQrq3RN+3/jtDAfbQrxafkXIJ6IqvXHxSPHVnCWS1Qzl
         xlOHFuMB5u8jm0plJjLxLB+Vw5/Q8oDkojg6pVG9iPQb2jKjG6Q9MlFPNyWqSfVnQ0kL
         MjkA==
X-Gm-Message-State: AFqh2kqakIAfXvWeQDgMznu6TuPAbmYnid463dY2PxaLTKfzG533pxEi
	ngz67sjVg1zvFR5+TSXyvQ==
X-Google-Smtp-Source: AMrXdXsdPNG8TH0x+2IAyk2abcc9M+PaIG7GDMdhZabCSwFyK7idZOfBF+6vwpZb+UKigpv5r9mK7g==
X-Received: by 2002:a05:6870:494b:b0:143:e045:7082 with SMTP id fl11-20020a056870494b00b00143e0457082mr12913559oab.58.1674496420250;
        Mon, 23 Jan 2023 09:53:40 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id bd36-20020a056808222400b00364ebf27363sm15742oib.0.2023.01.23.09.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 09:53:39 -0800 (PST)
Received: (nullmailer pid 2113958 invoked by uid 1000);
	Mon, 23 Jan 2023 17:53:39 -0000
Date: Mon, 23 Jan 2023 11:53:39 -0600
From: Rob Herring <robh@kernel.org>
To: Rayyan Ansari <rayyan@ansari.sh>
Cc: dri-devel@lists.freedesktop.org, ~postmarketos/upstreaming@lists.sr.ht, asahi@lists.linux.dev, janne@jannau.net, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, devicetree@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Javier Martinez Canillas <javierm@redhat.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 2/2] dt-bindings: display: simple-framebuffer:
 Document physical width and height properties
Message-ID: <20230123175339.GA2019900-robh@kernel.org>
References: <20230121153544.467126-1-rayyan@ansari.sh>
 <20230121153544.467126-3-rayyan@ansari.sh>
 <CAL_JsqL+G=Cxkc2j_NowznpqNAnixrU+-6SdccFbpMaP6OYSqQ@mail.gmail.com>
 <cdf32cb0-4529-6bbd-fdda-ae641d141ee5@ansari.sh>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cdf32cb0-4529-6bbd-fdda-ae641d141ee5@ansari.sh>

On Sun, Jan 22, 2023 at 05:25:38PM +0000, Rayyan Ansari wrote:
> On 22/01/2023 15:36, Rob Herring wrote:
> > On Sat, Jan 21, 2023 at 9:36 AM Rayyan Ansari <rayyan@ansari.sh> wrote:
> > > 
> > 
> > Why do you need this change?
> > 
> > The 'simple-framebuffer' contains data on how the bootloader
> > configured the display. The bootloader doesn't configure the display
> > size, so this information doesn't belong here. The information should
> > already be in the panel node, so also no point in duplicating it here.
> > 
> > > Signed-off-by: Rayyan Ansari <rayyan@ansari.sh>
> > > ---
> > >   .../devicetree/bindings/display/simple-framebuffer.yaml   | 8 ++++++++
> > >   1 file changed, 8 insertions(+)
> 
> Hi Rob,
> 
> There is the usecase that Hans has mentioned, but I have also mentioned
> another usecase previously.
> 
> Adding the width-mm and height-mm properties allows user interfaces such as
> Phosh (https://puri.sm/posts/phosh-overview/) to scale correctly to the
> screen. In my case, a panel node is not available and the aforementioned
> interface is in fact running on the SimpleDRM driver (which binds to the
> simple-framebuffer device).

Why is the panel node not available? Why not add it? Presumably it is 
not there because you aren't (yet) using the simple-panel driver (and 
others that would need). But presumably you will eventually as I'd 
imagine turning the screen off and back on might be a desired feature.

So why add a temporary DT property that's tied to your *current* kernel? 
The DT should not be tightly coupled to the kernel.

Rob
