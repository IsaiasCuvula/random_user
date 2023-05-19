abstract class Failure {}

class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

class ParsingJsonFailure extends Failure {}

class SendingEmailFailure extends Failure {}

class MakingCallFailure extends Failure {}
