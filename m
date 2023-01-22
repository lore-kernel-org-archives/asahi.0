Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA59A2590
	for <asahi@lists.linux.dev>; Sun, 22 Jan 2023 15:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674402146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IonFMa0lsWsZdfNk5QE4jBoQi/ruUQHMn+oqAHgqoH8=;
	b=HwdPa10g4V580Gm0YobhvC68a4XSSPb3VLKzTY2qEG/cSyXRGmfapdYr6uehseUU1T0FPL
	xB64erKuZY77e5P/vp0iOxUCYLFWQc0qFwlRcoApy/7//RiMziDsuSUl1i52WVZ9X13pw0
	2clgjHoRB7KuXS5M8l4AiguqnW2RcAU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-513-DWpjnJXAPqCcTrux0wpP_Q-1; Sun, 22 Jan 2023 10:42:25 -0500
X-MC-Unique: DWpjnJXAPqCcTrux0wpP_Q-1
Received: by mail-ed1-f72.google.com with SMTP id y2-20020a056402440200b0049e4d71f5dcso6897422eda.5
        for <asahi@lists.linux.dev>; Sun, 22 Jan 2023 07:42:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IonFMa0lsWsZdfNk5QE4jBoQi/ruUQHMn+oqAHgqoH8=;
        b=p7m2VWNuW14H7CFhoYdhzKLK82/BCz7KWadOlBdAOxfAZfRsZ3ZimZB/glQ6+GFwZU
         2VPzqZ+6OknGuGlRfF/rz+/iPJWA+UKvvlFzsfkKSX7NF8Dks767bbS3s196p1OXwpFx
         QzeVx5wVIwAOJgzP0hdmRH4nmiK9E/z17Ur34hNq2kRjDYTitH2ZPB2Ir5vuzCmIjQ2s
         WkbMhr3Imt317W8gsTpDnDdu3+Keay7SLuHh55PkB7AnSblQTCsgEpjz2dZH46K21c2d
         2NImHX/T+vX0nO7nK4yKJFEZV0K0/EqSMYoYvX+5MhuHR+hL5L7ZO/PF05vtcGJvUHs1
         HOwg==
X-Gm-Message-State: AFqh2kra3jy0fTYfubUIRN4x6AOseVLAGcIPrMJ9EAllVwrCY1j2GvyK
	Uxe4mLNIEI5if5tD9h3hgN99NN58Yr8bf9mJc2Lp1oz4rzu4oDzFWpu5Kwb+L7GP0ZXBNEeYP6U
	XExAabjHnfeW1G/o=
X-Received: by 2002:a17:906:b317:b0:86e:5124:20b0 with SMTP id n23-20020a170906b31700b0086e512420b0mr24453770ejz.64.1674402144010;
        Sun, 22 Jan 2023 07:42:24 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvxYtwlzriBymW6Z3D7aPp6YK0SgRgIwBhy9+XTG6Yr2FXU6lFqP+zhk9rsn87ItyMtBAKvXA==
X-Received: by 2002:a17:906:b317:b0:86e:5124:20b0 with SMTP id n23-20020a170906b31700b0086e512420b0mr24453748ejz.64.1674402143767;
        Sun, 22 Jan 2023 07:42:23 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id mb9-20020a170906eb0900b0084d34eec68esm19871820ejb.213.2023.01.22.07.42.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Jan 2023 07:42:23 -0800 (PST)
Message-ID: <efcca646-5dc3-359a-5453-2fe241af8f8c@redhat.com>
Date: Sun, 22 Jan 2023 16:42:22 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 2/2] dt-bindings: display: simple-framebuffer: Document
 physical width and height properties
To: Rob Herring <robh+dt@kernel.org>, Rayyan Ansari <rayyan@ansari.sh>
Cc: dri-devel@lists.freedesktop.org, ~postmarketos/upstreaming@lists.sr.ht,
 asahi@lists.linux.dev, janne@jannau.net, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, devicetree@vger.kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20230121153544.467126-1-rayyan@ansari.sh>
 <20230121153544.467126-3-rayyan@ansari.sh>
 <CAL_JsqL+G=Cxkc2j_NowznpqNAnixrU+-6SdccFbpMaP6OYSqQ@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAL_JsqL+G=Cxkc2j_NowznpqNAnixrU+-6SdccFbpMaP6OYSqQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1/22/23 16:36, Rob Herring wrote:
> On Sat, Jan 21, 2023 at 9:36 AM Rayyan Ansari <rayyan@ansari.sh> wrote:
>>
> 
> Why do you need this change?
> 
> The 'simple-framebuffer' contains data on how the bootloader
> configured the display. The bootloader doesn't configure the display
> size, so this information doesn't belong here. The information should
> already be in the panel node, so also no point in duplicating it here.

The idea is that early boot code which uses the simplefb node (no more
complex display driver loaded yet) knows the panel's DPI so that it can
decide if hi-dpi rendering / scaling is necessary or not.

This definitely is a useful feature to have.

I guess that for dt systems an alternative approach could be to
add a link to the panel node to the simplefb dt-node.

Regards,

Hans



