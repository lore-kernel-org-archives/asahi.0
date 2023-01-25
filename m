Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEA61381
	for <asahi@lists.linux.dev>; Wed, 25 Jan 2023 07:29:17 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id c4-20020a1c3504000000b003d9e2f72093so604573wma.1
        for <asahi@lists.linux.dev>; Tue, 24 Jan 2023 23:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q/zYb3mbFmjgoGxZfiqbziu2v8uAqk6hubRFYbxoSlc=;
        b=t6xI6eMY7T3NthJ8wINZKhVY4l2iBv+ao3N88MgKk0VGCKAVAjNjw8mNfFy8BTBMrG
         XgidFiiVBZBy+anLYqLhffAZjms+FGkPzTpgdgnOnKSncoQUPWV1lcSdkygzL6EmuW9I
         4YPGTwFyfLQOaUhDJF3SpXECnzEX6vwCg3ET5kHJ6xam4Puzf/80T1ksN+VLIA6uATxM
         ZIPYrNJhgunMvk8sPM11Gxirc6WS1IrmdvW+3qz4dhYDIXvg9He/GVuvPhOyqetY2ajJ
         Q0QJkv8Dp6PCcbuqv+Sc2JLYlFXFqJwX6hoB35vzT0V8JsJlK22MFGGMsMDn3OWfyhm3
         N3ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q/zYb3mbFmjgoGxZfiqbziu2v8uAqk6hubRFYbxoSlc=;
        b=iLWGMsCd+EUvuab93bYkZOc6Qys52KygCh/SfQQ6VLn1ZeM8Rhn3TTJsGJG1wfuB+H
         dSgpRE6BDOamV2ww4HZehPB0T9bgYHGYIz2i+w9ZbK9tZPcl4deQU3/Jk4JSyJo09Eto
         UrqVlbdeb+bDF1mqCIwEKZ4+QdO3unG44QdShW9TKuK+ellfK4AXVjKzRhXeQ1BzpE8K
         G352sY4nooJPpuh6Rtf758ttpGq6ZZOQE/TMLmz/gnBQrTvWZF61NE+VN75I/m1pE/CC
         h0ilmoWT6azccyIBHzF4mSN0Qxi1KKKKkv6+lJOfwUHh/z4YyuVRNkM/XZYM95m9DHQg
         PCCQ==
X-Gm-Message-State: AFqh2koe+Zq8k25ZxGXlqOOiRJ74giGiXa4fqKtjKd4AuYBh1YXOrb9V
	TglVugH7pZqv5laTxiedkhYPKQ==
X-Google-Smtp-Source: AMrXdXt9SGOwxEXr5Ol6TM9T8P204nWihJ4QLUqzCiu7G3/To6p6IruhCE/rq6883y/w0Ulpsu1yqA==
X-Received: by 2002:a05:600c:c05:b0:3db:2252:e50e with SMTP id fm5-20020a05600c0c0500b003db2252e50emr23239325wmb.24.1674631755424;
        Tue, 24 Jan 2023 23:29:15 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id g9-20020adff3c9000000b002bfb29d19e4sm2778121wrp.88.2023.01.24.23.29.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 23:29:14 -0800 (PST)
Message-ID: <90125055-929b-fdd1-3489-cfdc913594a5@linaro.org>
Date: Wed, 25 Jan 2023 08:29:13 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v3 2/2] dt-bindings: display: simple-framebuffer: Document
 physical width and height properties
Content-Language: en-US
To: Rayyan Ansari <rayyan@ansari.sh>, dri-devel@lists.freedesktop.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, asahi@lists.linux.dev,
 janne@jannau.net, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, devicetree@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20230124224142.7133-1-rayyan@ansari.sh>
 <20230124224142.7133-3-rayyan@ansari.sh>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230124224142.7133-3-rayyan@ansari.sh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/01/2023 23:41, Rayyan Ansari wrote:
> Document the optional width-mm and height-mm simple-framebuffer
> properties.

As pointed in previous discussion - you should have panel node and take
the properties from it. The physical dimensions are not properties of
framebuffer device. These are properties of panel.

Best regards,
Krzysztof

