Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA6D79EF
	for <asahi@lists.linux.dev>; Mon, 27 Feb 2023 20:06:42 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id h16so30635629edz.10
        for <asahi@lists.linux.dev>; Mon, 27 Feb 2023 12:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8uInxHePMiAlwvbGNwI0Ugw9k3Wci0tWnR38NP9c0+o=;
        b=MeSmGwQ/HmmBFMFaypLzcQiaH3ObjO8JAEpXdx+4wryYDhZg4v/dgFbvwzQoancUEC
         re5tVAHMzNYllS4LrS+9f6JkXeWGOWc5y6cHleQ7pw3qnZwjwzvTec56FGUbX0lb96oq
         764RFnD9qxYmvWsCASLSRoOdcIDEq29HZ0/RQvmPPQpAox1S1R/cz7N+JEkuSP7TtR0n
         8dqEVWMGjjUaNAVu1VBPKvpVu1CXwvRbL1LRus2ErmwuOnWPK3pbCvY0nvowMu5LBqtX
         C1Qs3G3Fd/K300A2XjRVbnB/WmwQxdZtKOCqXEoGrilYPZX2D6AlqptEEIjs3HG4nxw0
         Yxkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8uInxHePMiAlwvbGNwI0Ugw9k3Wci0tWnR38NP9c0+o=;
        b=unr3CdOmwkaZ8hOgst5xlnvdsyuzWIf6leG8CquYIicJFHkySRvVKjuwHm2fnlXX/i
         7YrxXwQHqU1qT8EmpCPbRUocoA0AQlN+4N7OHfZ0jqfL+JCQfNPZceDEaULE48OGPBeI
         0u1bH1pI5rrTTuIt91ezjDxmqMBxAf45fQqaDoOpRFJxPlduSVzrYcjbPa7xdKfx2iYB
         9v9ani2jKIc7OFC1O7GwyDzNWnI9qfvSthNWzxAI5+aXhfxNXh2xXXrEhgQZDR9SS03O
         2rl3bhOsSeqX8WaITO9Ltx7xujdF3FA2AkEm9yIDj4maeskv3Wsypni0skOKuD6CpjRe
         8RGg==
X-Gm-Message-State: AO0yUKXvyruB35crb9i85maCI68lRkMTVX+05JYpO2+0f0r7ZZxuwnaP
	U756KrP7gBsr+g4UQPH1aXFTKCCtfQaFu4R3Wpw=
X-Google-Smtp-Source: AK7set+rFRwwuHlNUo6YttoaHQUv1gV4hohZb6nayx6SZjljKZP1HvI16epTaVLppOg3ZaqYoXlGCrsWA0NVSYZEKns=
X-Received: by 2002:a50:d494:0:b0:4ad:72b2:cf57 with SMTP id
 s20-20020a50d494000000b004ad72b2cf57mr461379edi.0.1677528400166; Mon, 27 Feb
 2023 12:06:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230223-z2-for-ml-v1-0-028f2b85dc15@gmail.com>
 <20230223-z2-for-ml-v1-1-028f2b85dc15@gmail.com> <20230227195139.GA677578-robh@kernel.org>
In-Reply-To: <20230227195139.GA677578-robh@kernel.org>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Mon, 27 Feb 2023 21:06:28 +0100
Message-ID: <CAMT+MTRodB_+sMtoPxv-gP_+sJAwNb36XuLOGo=HvuCQq6h+gQ@mail.gmail.com>
Subject: Re: [PATCH RFC 1/4] dt-bindings: input: touchscreen: Add Z2
 controller bindings.
To: Rob Herring <robh@kernel.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, - <asahi@lists.linux.dev>, 
	Henrik Rydberg <rydberg@bitmath.org>, linux-arm-kernel@lists.infradead.org, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Feb 2023 at 20:51, Rob Herring <robh@kernel.org> wrote:
>
> > +properties:
> > +  compatible:
> > +    const: apple,z2-touchscreen
>
> Is 'z2' anything other than a touchscreen? If not, '-touchscreen' is
> redundant. If so, then what else is there? You should be describing
> physical devices, not just a protocol for touchscreen.
>

This is a class of touchscreen controllers that talk the z2 protocol
over spi.

> > +                    touchscreen-size-y = <640>;
> > +                    apple,z2-device-name = "MacBookPro17,1 Touch Bar";
>
> Why do we need this string? If you want a human consumed label for
> some identification, we have a property for that purpose. It's called
> 'label'. But when there is only 1 instance, I don't really see the
> point.

I want a libinput-consumed label to distinguish between devices
using this protocol. It is used both for 'normal' touchscreens, and,
as is in this example a 'touchbar', which absolutely should not be
treated as a normal touchscreen, and needs special handling in
userspace.
