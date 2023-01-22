Received: from out2.migadu.com (out2.migadu.com [188.165.223.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D4F322E
	for <asahi@lists.linux.dev>; Sun, 22 Jan 2023 17:28:39 +0000 (UTC)
Message-ID: <bb31312f-ab63-e4e7-7bb0-d34e1ef345b9@ansari.sh>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ansari.sh; s=key1;
	t=1674408510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CVnhlHIDXW8jM0hViaqzzoOuRaBb3rDy5+wV/MVwuS4=;
	b=dwkapQ5Hg/qahMqBQJTWwe99k/8s4VKcUOPtPA+dRpp8wV+riCewU05EGVJ3GM+77fs8fm
	ZzGdLMyxempHcH8WttqXgRruWKnH15FBPMFqIT6FosRNvjw/2UYvpHhAuAnEMUYQUP9bEE
	fPYJoMoPzvJxgCS2EFhV69FnsbEkRy4=
Date: Sun, 22 Jan 2023 17:28:29 +0000
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/2] dt-bindings: display: simple-framebuffer: Document
 physical width and height properties
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 David Airlie <airlied@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
 janne@jannau.net, asahi@lists.linux.dev,
 Javier Martinez Canillas <javierm@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230121153544.467126-1-rayyan@ansari.sh>
 <20230121153544.467126-3-rayyan@ansari.sh>
 <167440123887.2283488.2841716718270566192.robh@kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Rayyan Ansari <rayyan@ansari.sh>
In-Reply-To: <167440123887.2283488.2841716718270566192.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 22/01/2023 15:31, Rob Herring wrote:
> 
> On Sat, 21 Jan 2023 15:35:44 +0000, Rayyan Ansari wrote:
>> Signed-off-by: Rayyan Ansari <rayyan@ansari.sh>
>> ---
>>   .../devicetree/bindings/display/simple-framebuffer.yaml   | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/simple-framebuffer.yaml: properties:width-mm: '$ref' should not be valid under {'const': '$ref'}
> 	hint: Standard unit suffix properties don't need a type $ref
> 	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/simple-framebuffer.yaml: properties:height-mm: '$ref' should not be valid under {'const': '$ref'}
> 	hint: Standard unit suffix properties don't need a type $ref
> 	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230121153544.467126-3-rayyan@ansari.sh
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 

I will remove the $ref property in v2, but I will also wait if there is 
any other feedback to address.

-- 
Rayyan Ansari
https://ansari.sh

