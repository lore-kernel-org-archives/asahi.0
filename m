Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B717461
	for <asahi@lists.linux.dev>; Wed,  2 Nov 2022 16:26:04 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id l8so14803965ljh.13
        for <asahi@lists.linux.dev>; Wed, 02 Nov 2022 09:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=i9lzFBitnyAp6ipWpwtICbzA7hqqgUYQcinpTzvMvYI=;
        b=pE3B01zFCVw+bIUAPWnhHJVI4HcUniogBqFng7orjWDucp24hEY7aCrqjDuO6GV6hM
         YSu5meS5CRBEILfG0g6tdvKOR9x44wyXJAXK/wQ0VHKqUkLclJeEZX8tEklUhNyRClvC
         tkaWHlt2A5zuihz51DFhN6Jwlrtrkglb8YvMFNw9Q2LyLwSUpkLRmkO9Yd4vIFLeercb
         pHdVDYN32QXUIfuydzeuJ2zCpen7H8ise2cmH1/CEXU3af7Bky29LQAha/r4RpKRXz3C
         TL/nArGGa58sBE/P2nuzY7qUCjG/V+HRkVZZyoIXbguWohQuZnynAiIQ6cwVMrsjaUf1
         V7CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i9lzFBitnyAp6ipWpwtICbzA7hqqgUYQcinpTzvMvYI=;
        b=BocCwYuqnPJc4yZZegdUL9+1TZpRN5NWWToevnsyrzeuBJ0X3gQBXBUe3JhEcFQ7r1
         bCcUePQHCI7uOMLmnwCIyZmytt6MC6ht6X+V9eT03yyQJbZtEiqbpD68QSabJr6Jq/FC
         NATrCbtBaE2t0OUG9lkVnGZw6fSDFy72RYJBCDVMXI/5zv2N2bbZzD1stLS11S0RkBO/
         z4zG08wZLpWkC6cYC5k+Txj/ZIUOCpSQKDwvyvhLR10DSu/jwSFM8uM7Sbzw15aYxUc3
         NeZOMtCWTNUocmQGWaVyowkG5LMh4eigaqhq55XAF5wiD147Eoy1YA3QMGtXMEUs9fBZ
         ikPw==
X-Gm-Message-State: ACrzQf2jmiF5QIh3INAf9Wk/gkqzcEbVVfJZyQx8jglNApcCrWFqmgUF
	DVe5hok7ufalIaBI3L4mzHLpHPQJmZWCSRyrdFc=
X-Google-Smtp-Source: AMsMyM6IbNesFItHd+WCfCAtu+r/QS5DLwm2t+DZtQmi2xg5qQZv8LtFV2vCfxx4R8Q8SmpZvAFp2FCTROx9tNrxDFk=
X-Received: by 2002:a05:651c:33c:b0:277:e2b:de4a with SMTP id
 b28-20020a05651c033c00b002770e2bde4amr9519495ljp.55.1667406362096; Wed, 02
 Nov 2022 09:26:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221102141513.49289-1-fnkl.kernel@gmail.com> <20221102141513.49289-3-fnkl.kernel@gmail.com>
 <OS0PR01MB59227A9E7B8A471E4D6B665786399@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMT+MTT1ptFymwDdOe=OXYzKfOPHdQbAfpx_9LBYn+C9NFhddg@mail.gmail.com> <OS0PR01MB592217539BCA46FD8F523C2386399@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB592217539BCA46FD8F523C2386399@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Wed, 2 Nov 2022 19:25:50 +0300
Message-ID: <CAMT+MTQLJZsDSOtcQqV8e_j0XKfjNm+dVjeo7ocMjcYOPLAPvA@mail.gmail.com>
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

On Wed, 2 Nov 2022 at 19:02, Biju Das <biju.das.jz@bp.renesas.com> wrote:

> I just asked, because you are unnecessarily turning on the clock or increasing the usage
> Count, even if it is not used by anyone during probe.

It is used to get the clock rate so it can be used to convert between
seconds and pwm ticks, and the pwm uses that clock, so it is kept
enabled while the pwm is active.
