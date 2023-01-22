Received: from out-29.mta0.migadu.com (out-29.mta0.migadu.com [91.218.175.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D741B33D8
	for <asahi@lists.linux.dev>; Sun, 22 Jan 2023 18:19:40 +0000 (UTC)
Message-ID: <cdf32cb0-4529-6bbd-fdda-ae641d141ee5@ansari.sh>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ansari.sh; s=key1;
	t=1674408340;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zNlCaEENnr2E6T9VSpQMskYXTPIwdkrlcdCRQqfBtOM=;
	b=VOT0GTIZywb4evsNGliJqALCozr69B1bLNkLQ2lQ9PQ4fHmFq6vNx482gV3j6w7xxs/oyv
	gWZRY2YBa59rob66gqpjXikqbmNlcf1NKvdNsiZokZxnDhlYNJA3zkK/piNkSfit9o51yD
	NCncQyfn3OYk4fbM9Pc9XGf/ZKJfY8U=
Date: Sun, 22 Jan 2023 17:25:38 +0000
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/2] dt-bindings: display: simple-framebuffer: Document
 physical width and height properties
To: Rob Herring <robh+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, ~postmarketos/upstreaming@lists.sr.ht,
 asahi@lists.linux.dev, janne@jannau.net, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, devicetree@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20230121153544.467126-1-rayyan@ansari.sh>
 <20230121153544.467126-3-rayyan@ansari.sh>
 <CAL_JsqL+G=Cxkc2j_NowznpqNAnixrU+-6SdccFbpMaP6OYSqQ@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Rayyan Ansari <rayyan@ansari.sh>
In-Reply-To: <CAL_JsqL+G=Cxkc2j_NowznpqNAnixrU+-6SdccFbpMaP6OYSqQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 22/01/2023 15:36, Rob Herring wrote:
> On Sat, Jan 21, 2023 at 9:36 AM Rayyan Ansari <rayyan@ansari.sh> wrote:
>>
> 
> Why do you need this change?
> 
> The 'simple-framebuffer' contains data on how the bootloader
> configured the display. The bootloader doesn't configure the display
> size, so this information doesn't belong here. The information should
> already be in the panel node, so also no point in duplicating it here.
> 
>> Signed-off-by: Rayyan Ansari <rayyan@ansari.sh>
>> ---
>>   .../devicetree/bindings/display/simple-framebuffer.yaml   | 8 ++++++++
>>   1 file changed, 8 insertions(+)

Hi Rob,

There is the usecase that Hans has mentioned, but I have also mentioned 
another usecase previously.

Adding the width-mm and height-mm properties allows user interfaces such 
as Phosh (https://puri.sm/posts/phosh-overview/) to scale correctly to 
the screen. In my case, a panel node is not available and the 
aforementioned interface is in fact running on the SimpleDRM driver 
(which binds to the simple-framebuffer device).

Here is the device I have tested this patch on, the Lumia 735 phone: 
https://wiki.postmarketos.org/images/c/c3/Lumia_735_Phosh.png
Without this patch, this would appear quite small on the screen.

See https://patchwork.freedesktop.org/patch/519107/?series=113053&rev=1 
for some background info about this patch.

Regards,
-- 
Rayyan Ansari
https://ansari.sh

