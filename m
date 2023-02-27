Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309FC28E1
	for <asahi@lists.linux.dev>; Mon, 27 Feb 2023 22:25:20 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id ee7so32212597edb.2
        for <asahi@lists.linux.dev>; Mon, 27 Feb 2023 14:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=weQbce3Nd/hM6xXy3nvlFQno/x9AdFR4oWdiig5I/6A=;
        b=q14oy//aCiLK/UNRMDIwpFjscBsMO6yDoMErR7cy8UfFns4rKPcxrzK8GJM/nCVti/
         Ji03+2jD/2h1yfpaRQ20LwF8wstet9eFax4N4r9jKYTYoYUYoZMlgNxzo4z8bFedN/8h
         0xVO8957bvxnyX/e8MDVyg/l7PAc1VL8Ym7dzkXiDQcWxbisYtIH0UXQ7oTz80K9OjYM
         RKHwJnZZjJjSKur+ZJoDiXHZyCO/KlL24jNTmME0fm+i8SNetTJEP7VBtQcKSzsDZV+H
         C9dxxUjqi2f0bmt7FN7xM8sIA5w5WXpGWjfX4qoyayuyxHcRj+2BMa1dhBWry1wBpHGH
         KX6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=weQbce3Nd/hM6xXy3nvlFQno/x9AdFR4oWdiig5I/6A=;
        b=6RO7iwoF+wK0eIG9ABY4h90AN3IYbLfeaKipAL7QgNVjX2O1XhjMogtwrjMCeAjs61
         qnx136+224+K5cZvMdDqG66ihoTKuSdS1sHsXV8v8ZuXfz8oxt4KIvU+aqlcvb3A4AQC
         vE4N9vMGGoFKs1LzglO1To3J5nGZ+DZi7gHnFSYg2PZ01gkzlG1RHFdwWaKrp29gcdZo
         0UjkeoER7l7U/epiF6b8fxXN5/czxH5pyslcS5NuRFy5agwUPvH8sX7jySaQVCIlAoA1
         YkXrD4xs5jGUCru5ro3RCcq4chx+tyWMaEMuC1Hz3NbO1yXGdJ68tuZo+7D/zEwt4Zqp
         uNhA==
X-Gm-Message-State: AO0yUKVErOWNze1Z0eoTE2Udwy69HEIX7u96fQsjIKUO3ZJ2HDkDaHrT
	0aukqRHVmGii2I65CQQpf1mlz2c6Kkxjp7WWBm0=
X-Google-Smtp-Source: AK7set8/KolOeO5KtwxAKdFVqWdjyZbfi98she0qCRw8+0k5cqzsBRN7japO9oJpd6gDvmZLnjr3sjZ9mecacJi9Inw=
X-Received: by 2002:a17:907:a0e:b0:8f7:f3d4:942c with SMTP id
 bb14-20020a1709070a0e00b008f7f3d4942cmr824625ejc.7.1677536718232; Mon, 27 Feb
 2023 14:25:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230223-z2-for-ml-v1-0-028f2b85dc15@gmail.com>
 <20230223-z2-for-ml-v1-1-028f2b85dc15@gmail.com> <20230227195139.GA677578-robh@kernel.org>
 <CAMT+MTRodB_+sMtoPxv-gP_+sJAwNb36XuLOGo=HvuCQq6h+gQ@mail.gmail.com> <20230227221426.GA1048218-robh@kernel.org>
In-Reply-To: <20230227221426.GA1048218-robh@kernel.org>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Mon, 27 Feb 2023 23:25:06 +0100
Message-ID: <CAMT+MTTH-DC+1wMFUGNwVM3cYm0B+XVK7wL07khdy1hSjyhDGA@mail.gmail.com>
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

On Mon, 27 Feb 2023 at 23:14, Rob Herring <robh@kernel.org> wrote:
> I know little about libinput, but how would it know about
> 'apple,z2-device-name'?
>
The idea was to forward the contents of this property
into the input device name.
